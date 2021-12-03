#Задача №3
#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы

function do_upora(r::Robot, side::HorizonSide)
    k = 0
    while isborder(r, side)==false
        move!(r, side )
        k+=1
    end
    return k
end

function move_steps(r::Robot, side::HorizonSide, steps::Int)
    for _ in 1:steps
        move!(r,side)
    end 
end 


function marker_line(r::Robot,side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function zmeika(r::Robot)
    x = do_upora(r,West)
    y = do_upora(r,Sud)
    for i in 1:y
        putmarker!(r)
        marker_line(r,Ost)
        if isborder(r,Nord) == false 
            move!(r,Nord)
        else 
            break
        end
        putmarker!(r)
        marker_line(r,West)
        if isborder(r,Nord) == false
            move!(r,Nord)
        else 
            break
        end
    end
    do_upora(r,West)
    do_upora(r,Sud)
    move_steps(r,Ost,x)
    move_steps(r,Nord,y)
end
