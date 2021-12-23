function main4!(r)
    array = []
    side = Ost
    west_or_sud_in_array!(r, array)
    diagonal_markers!(r, West, Nord)
    should_we_put_marker(r, side)
    back!(r, array)
end

function diagonal_markers!(r, side1, side2)
    while !(isborder(r, side1)&&isborder(r, side2))
        putmarker!(r)
        if !isborder(r, side1)
            move!(r, side1)
        end
        if !isborder(r, side1)
            move!(r, side2)
        end
    end
end
#Эта функция позволяет нам сделать диагональ 


function should_we_put_marker(r, side)
    choose_side = true
    while choose_side == true
        while !ismarker(r)
            putmarker!(r)
            move!(r, side)
        end
        while (ismarker(r) == true)&&(!isborder(r, inverse(side)))
            move!(r, inverse(side))
        end
        if (!isborder(r, Sud))
            move!(r, Sud)
        else
            choose_side = false
        end
    end
end

#should_we_put_marker - будет проверять поставить ли маркер в клетке, 
#пока робот не будет находится
#в клетке где стоит маркер она и 
#возвращается назад и спускается вниз если пройдет проверку

function inverse(side)
    HorizonSide(mod(Int(side)+2, 4))
end

function west_or_sud_in_array!(r, array)
    while !(isborder(r, Ost) && isborder(r, Sud))
        if !isborder(r, Ost)
            move!(r, Ost)
            push!(array, Ost)
        end
        if !isborder(r, Sud)
            move!(r, Sud)
            push!(array, Sud)
        end
    end
end

function back!(r, array)
    while length(array)>0
        side=pop!(array)
        move!(r, inverse(side))
    end
end