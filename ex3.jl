function main3!(r)
    array = []
    side = Ost
    west_or_sud_in_array!(r, array)
    while !isborder(r, Nord)
        putmarker!(r)
        putmarkers!(r, side)
        side = inverse(side)
        if !isborder(r, Nord)
            move!(r, Nord)
        end
    end
    putmarker!(r)
    putmarkers!(r, side)
    moves!(r, West)
    moves!(r, Sud)
    back!(r, array)
end

#putmarkers!(r, side) - фунция, которая проверяет нет ли бортиков и 
#если их нет, то ставит маркеры

function putmarkers!(r, side)
    while !isborder(r, side)
        move!(r, side)
        putmarker!(r)
    end
end

#moves!(r, side) - функция, где робот проверяет нет ли перегородки 
#и ставит маркер

function moves!(r, side)
    while !isborder(r, side)
        move!(r, side)
    end
end

#Функция inverse(side) преобразует элементы из side в Int, давая следующие значения: Nord=0,
#Sud = 1, West = 2, Ost = 3 и путём прибавления к числу Int числа 2 и взятия остатка от деления на 4
#сторона меняется на противоположную

function inverse(side)
    HorizonSide(mod(Int(side)+2, 4))
end


function west_or_sud_in_array!(r, arr)
    while !(isborder(r, West)&&isborder(r, Sud))
        if !isborder(r, West)
            move!(r, West)
            push!(array, West)
        end
        if !isborder(r, Sud)
            move!(r, Sud)
            push!(array, Sud)
        end
    end
end

#west_or_sud_in_array заполняет массив значениями West или Sud. Пока 
#слева и справа нет перегоррдки будет выполняться проверка наличия перегородки 
#и если её нет, то робот движется и добавляет элемент в массив

function back!(r, arr)
    while length(array)>0
        side=pop!(array)
        move!(r, inverse(side))
    end
end

#в back! проверяется длина переданного массива и если она не равна 0, 
#то робот будет двигаться в противоположном направлении до тех пор, пока 
#элементы не удалятся и длина массива не станет равной 0