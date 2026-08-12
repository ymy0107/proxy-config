const fs = require('fs');

// 1. 读取 V2Ray / Xray 的 JSON 配置文件
const rawData = fs.readFileSync('proxy.json', 'utf8');
const config = JSON.parse(rawData);

const links = [];

// 2. 遍历 outbounds 数组并转换提取节点链接
if (config.outbounds && Array.isArray(config.outbounds)) {
  config.outbounds.forEach((outbound) => {
    const protocol = outbound.protocol;
    const name = encodeURIComponent(outbound.tag || 'Node');
    const stream = outbound.streamSettings || {};

    // 过滤掉本地直连 (freedom) 和黑洞 (blackhole)
    if (protocol === 'freedom' || protocol === 'blackhole') {
      return;
    }

    // Shadowsocks (SS)
    if (protocol === 'shadowsocks') {
      const server = outbound.settings?.servers?.[0];
      if (server) {
        const userinfo = Buffer.from(`${server.method}:${server.password}`).toString('base64');
        links.push(`ss://${userinfo}@${server.address}:${server.port}#${name}`);
      }
    }

    // SOCKS5
    else if (protocol === 'socks') {
      const server = outbound.settings?.servers?.[0];
      const user = server?.users?.[0];
      if (server) {
        let url = 'socks5://';
        if (user && user.user) {
          url += `${encodeURIComponent(user.user)}:${encodeURIComponent(user.pass || '')}@`;
        }
        url += `${server.address}:${server.port}`;
        const params = [];
        if (stream.security === 'tls') params.push('tls=1');
        if (stream.tlsSettings?.serverName) {
          params.push(`sni=${encodeURIComponent(stream.tlsSettings.serverName)}`);
        }
        if (params.length) url += '?' + params.join('&');
        url += `#${name}`;
        links.push(url);
      }
    }

    // HTTP
    else if (protocol === 'http') {
      const server = outbound.settings?.servers?.[0];
      const user = server?.users?.[0];
      if (server) {
        let url = 'http://';
        if (user && user.user) {
          url += `${encodeURIComponent(user.user)}:${encodeURIComponent(user.pass || '')}@`;
        }
        url += `${server.address}:${server.port}`;
        const params = [];
        if (stream.security === 'tls') params.push('tls=1');
        if (stream.tlsSettings?.serverName) {
          params.push(`sni=${encodeURIComponent(stream.tlsSettings.serverName)}`);
        }
        if (params.length) url += '?' + params.join('&');
        url += `#${name}`;
        links.push(url);
      }
    }

    // Trojan
    else if (protocol === 'trojan') {
      const server = outbound.settings?.servers?.[0];
      if (server) {
        let url = `trojan://${encodeURIComponent(server.password)}@${server.address}:${server.port}`;
        const params = [];
        if (stream.tlsSettings?.alpn) {
          const alpnStr = Array.isArray(stream.tlsSettings.alpn)
            ? stream.tlsSettings.alpn.join(',')
            : stream.tlsSettings.alpn;
          params.push(`alpn=${encodeURIComponent(alpnStr)}`);
        }
        if (params.length) url += '?' + params.join('&');
        url += `#${name}`;
        links.push(url);
      }
    }

    // VMess
    else if (protocol === 'vmess') {
      const target = outbound.settings?.vnext?.[0];
      const user = target?.users?.[0];
      if (target && user) {
        const vmessObj = {
          v: "2",
          ps: outbound.tag || "vmess",
          add: target.address,
          port: target.port,
          id: user.id,
          aid: user.alterId || 0,
          scy: user.security || "auto",
          net: stream.network || "tcp",
          type: "none",
          host: stream.wsSettings?.headers?.Host || "",
          path: stream.wsSettings?.path || "",
          tls: stream.security === "tls" ? "tls" : ""
        };
        const vmessBase64 = Buffer.from(JSON.stringify(vmessObj, null, 2)).toString('base64');
        links.push(`vmess://${vmessBase64}`);
      }
    }

    // VLess
    else if (protocol === 'vless') {
      const target = outbound.settings?.vnext?.[0];
      const user = target?.users?.[0];
      if (target && user) {
        let url = `vless://${user.id}@${target.address}:${target.port}`;
        const params = [];
        if (stream.network) params.push(`type=${stream.network}`);
        if (stream.wsSettings?.path) {
          params.push(`path=${encodeURIComponent(stream.wsSettings.path)}`);
        }
        if (stream.security === 'tls') params.push('security=tls');
        if (params.length) url += '?' + params.join('&');
        url += `#${name}`;
        links.push(url);
      }
    }
  });
}

// 3. 导出明文节点 TXT 文件 (proxy_plain.txt)
const plainOutput = links.join('\n');
fs.writeFileSync('proxy_plain.txt', plainOutput, 'utf8');
console.log('✅ 已生成明文 TXT 文件: proxy_plain.txt');

// 4. 导出 Base64 格式的订阅 TXT 文件 (proxy_subscription.txt)
const base64Output = Buffer.from(plainOutput).toString('base64');
fs.writeFileSync('proxy_subscription.txt', base64Output, 'utf8');
console.log('✅ 已生成 Base64 订阅 TXT 文件: proxy_subscription.txt');