function main9!(r::Robot)
    steps = 1
    side = Nord
    while ismarker(r)==false
        for _ in 1:2
            special_move!(r,side,steps)
            side=counter(side)
        end
        steps += 1
    end
end
function special_move!(r, side, num::Int)
    for _ in 1:num
        if ismarker(r)
            return nothing
        end
        move!(r,side)
    end
end
function counter(side)
    return HorizonSide(mod(Int(side)+1,4))
end