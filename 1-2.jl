# Задача № 1
# ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
# РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.

function marker_line(r::Robot,side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function return_by_tokens(r::Robot,side::HorizonSide)
    while ismarker(r) == true
        move!(r, side)
    end        
end

function krest(r::Robot)
    marker_line(r, Nord)
    return_by_tokens(r, Sud)
    marker_line(r, Sud)
    return_by_tokens(r, Nord)
    marker_line(r, Ost)
    return_by_tokens(r, West)
    marker_line(r, West)
    return_by_tokens(r, Ost)
    putmarker!(r)
    
end 

