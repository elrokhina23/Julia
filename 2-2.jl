# Задача №2
# ДАНО: Робот - в произвольной клетке поля (без внутренних перегородок и маркеров)
# РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промакированы



function do_upora(r::Robot, side::HorizonSide)
    while isborder(r, side)==false
        move!(r, side )
    end
end


function marker_line(r::Robot,side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function perimetr(r::Robot)
    do_upora(r, Ost)
    marker_line(r,Nord)
    marker_line(r,West)
    marker_line(r,Sud)
    marker_line(r,Ost)
    marker_line(r,Nord)
    putmarker!(r)
    
end 

