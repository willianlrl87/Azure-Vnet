# login no azure
Connect-AzAccount -UseDeviceAuthentication

# Parametros
$rg = 'rg-vnet-powershell'
$local = 'brazilsouth'
$vnetname = 'vnet-powershell'

# Criar grupo de recursos
New-AzResourceGroup -Name $rg -Location $local

# Criar vnet e subnet
$snet = New-AzVirtualNetworkSubnetConfig -Name 'snet1' -AddressPrefix 10.0.0.0/24
New-AzVirtualNetwork -Name $vnetname -ResourceGroup $rg -Location $local -AddressPrefix 10.0.0.0/16 -Subnet $snet

# Listar VNET's
Get-AzVirtualNetwork -Name $vnetname -ResourceGroup $rg