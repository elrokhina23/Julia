# Задача №2
# ДАНО: Робот - в произвольной клетке поля (без внутренних перегородок и маркеров)
# РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промакированы



function do_upora(r::Robot, side::HorizonSide)
    k = 0
    while isborder(r, side)==false
        move!(r, side )
        k+=1
    end
    return k
end

#Функция do_upora - функция, проверяющая отсутствие бортиков в 
#в заданном направлении и двигается, если их нет. В k считается
#количество пройденных шагов 

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

#Функция marker_line проверяет отстутсвие бортиков и ставит маркеры

function perimetr(r::Robot)
    x = do_upora(r, Ost)
    y = do_upora(r,Sud)
    marker_line(r,Nord)
    marker_line(r,West)
    marker_line(r,Sud)
    marker_line(r,Ost)
    move_steps(r, Nord, y)
    move_steps(r, West, x)
end 
#Функция perimetr - основная функция
