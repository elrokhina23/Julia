function main1(r::Robot)
    for side in [Nord, Sud, West, Ost]
        putmarkers!(r,side)
        back!(r,side)
    end 
    putmarker!(r)
end 

function putmarkers!(r,side)
    if !isborder(r,side)
        move!(r,side)
        putmarker!(r)
    end 
end  

function back!(r,side)
    if ismarker(r,inverse(side))
        move!(r,side)
    end 
end


function inverse(side)
    HorizonSide(mod(Int)+2,4)
end


