function do_upora(r::Robot, side::HorizonSide)
    while isborder(r, side)==false
        move!(r, side )
    end
end


function bbb(r::Robot,side::HorizonSide)
    while ismarker(r) == true
        move!(r, side)
    end        
end

function perimetr(r::Robot)
    do_upora(r, Ost)
    aaa(r,Nord)
    aaa(r,West)
    aaa(r,Sud)
    aaa(r,Ost)
    aaa(r,Nord)
    putmarker!(r)
    
end 

