interface = peripheral.find("advanced_crystal_interface")

function dial(address)
   
    local addressLength = #address
    
    local start = interface.getChevronsEngaged() + 1
    
    for chevron = start,addressLength,1
    do
        
        local symbol = address[chevron]
        
        interface.engageSymbol(symbol)

        if chevron % 2 == 0 then
            interface.rotateClockwise(symbol)
        else
            interface.rotateAntiClockwise(symbol)
        end    
        while(not interface.isCurrentSymbol(symbol))
        do
            sleep(0)
        end
        sleep(1)
        interface.openChevron() 
        sleep(1)
        interface.closeChevron() 
        sleep(1)
        
        
    end 
end

abydosAddress = {26,6,14,31,11,29,0}
--Do note that the Point of Origin (number 0)
--is considered a part of the address
--and if you forget it, the dialing sequence
--will not finish
chulakAddress = {8,1,22,14,36,19,0}

lanteaAddress = {18,20,1,15,14,7,19}

print("Avaiting input:")

print("1 = Abydos")
print("2 = Chulak")
print("3 = Lantea")

input = tonumber(io.read())
sleep(0)

if input == 1 then
    dial(abydosAddress) 
elseif input == 2 then
    dial(chulakAddress)
elseif input == 3 then
    dial(lanteaAddress)
else
    print("Invalid input")
end

--If you want to add more addresses, just
--add them to other addresses and extend this block

