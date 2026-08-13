Set-VpnConnectionIPsecConfiguration -ConnectionName "My ikev2 VPN" `
    -AuthenticationTransformConstants SHA256 `
    -CipherTransformConstants AES256 `
    -EncryptionMethod AES256 `
    -IntegrityCheckMethod SHA256 `
    -DHGroup Group14 `
    -PfsGroup PFS2048 `
    -Force