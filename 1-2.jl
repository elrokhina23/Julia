function aaa(r::Robot,side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function bbb(r::Robot,side::HorizonSide)
    while ismarker(r) == true
        move!(r, side)
    end        
end

function krest(r::Robot)
    aaa(r, Nord)
    bbb(r, Sud)
    aaa(r, Sud)
    bbb(r, Nord)
    aaa(r, Ost)
    bbb(r, West)
    aaa(r, West)
    bbb(r, Ost)
    putmarker!(r)
    
end 

