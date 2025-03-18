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


# Listar vnet
Get-AzVirtualNetwork -Name $vnetname -ReseourceGroupName $rg

# Deletar vnet
Remove-AzVirtualNetwork -Name $vnetname -ResourceGroupName $rg

# Criar multiplas subnets na vnet
$snet1 = New-AzVirtualNetworkSubnetConfig -Name 'snet-1' -AddressPrefix '10.3.1.0/24'
$snet2 = New-AzVirtualNetworkSubnetConfig -Name 'snet-2' -AddressPrefix '10.3.2.0/24'

New-AzVirtualNetwork -Name $vnetname -ResourceGroupName $rg -Location $local -AddressPrefix '10.3.0.0/16' -Subnet $snet1, $snet2

# Listar subnets na vnet
Get-AzVirtualNetwork -Name $vnetname -ResourceGrupName $rg | Select-Object Subnet

# Adicionar subnet em rede virtual já existente
# Obter subnet 1 e 2
$snet1 = Get-AzVirtualNetworkSubnetConfig -Name 'snet-1' -VirtualNetwork $vnet
$snet2 = Get-AzVirtualNetworkSubnetConfig -Name 'snet-2' -VirtualNetwork $vnet

# Criar nova subnet
$snet3 = New-AzVirtualNetworkSubnetConfig -Name 'snet-3' -AddressPrefix '10.3.3.0/24'

# Adicionar subnet 3 e sobreescrever vnet
New-AzVirtualNetwork -Name $vnetname -ResourceGroupName $rg -Location $local -AddressPrefix '10.3.0.0./16' -Subnet $snet1, $snet2, $snet3 | Set-AzVirtualNetwork

# Excluir o grupo de recursos com as subnets e vnet
Remove-AzResourceGroup -Name $rg -y
=======
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
>>>>>>> d32019d6a8067d0eae53ffab41c3537373ec6bd2
