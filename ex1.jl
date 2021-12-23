function main1(r::Robot)
    for side in [Nord, Sud, West, Ost]
        putmarkers!(r,side)
        back!(r,inverse(side))
    end 
    putmarker!(r)
end 

#Функция main1 - основная функция, рисующая крест на поле, перебирая стороны Nord, 
#Sud, West, Ost. Далее все элементы передаются в функции putmsrkers! и back! После выполнения
#функции появляется крест

function putmarkers!(r,side)
    if !isborder(r,side)
        move!(r,side)
        putmarker!(r)
    end 
end  
#Функция putmarkers! проверяет наличие бортика и если его нет, то робот движется и ставит маркер 
function back!(r,side)
    while ismarker(r)==true
        move!(r,side)
    end 
end
#Функция back! проверяет наличие маркера в обратном направлении и если он есть,
#то робот движется по маркерам


function inverse(side)
    HorizonSide(mod(Int)+2,4)
end
#Функция inverse(side) преобразует элементы из side в Int, давая следующие значения: Nord=0,
#Sud = 1, West = 2, Ost = 3 и путём прибавления к числу Int числа 2 и взятия остатка от деления на 4
#сторона меняется на противоположную


