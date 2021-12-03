function f()       
    x = []  
    y = [10,20,30]
    for i in 1:length(y)
        println(y[i])
    end 
end 

function (f)  
    x = [1,2,3]
    push!(x,4)
    print_array(x)
    pop!(x) 
    print_array(x)
end 

function print_array(x)
    for el in x
        println(el, " ")
    end
    println()
end

function mark_angles(r::Robot)
    moves = []
    go_to_corner!(r, moves)
    print_markers!(r)
    return_back!(r, moves)
end 

function go_to_corner!(r::Robot, moves)
    while !(isborder(r,West) && isborder(r,Sud))
        if isborder(r,West) == false
            move!(r,West)
            push!(moves,West)
        end 
        if isborder(r,Sud) == false
            move!(r,Sud)
            push!(moves,Sud)
        end 
    end 
end

function moves!(r::Robot, side::HorizonSide)
    while isborder(r,side) == false
        move!(r,side)
    end 
end 

function print_markers!(r::Robot)
    for side in (Nord, Ost, Sud, West)
        moves!(r,side)
        putmarker!(r)
    end 
end 

function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side)+2,4))
end 

function return_back!(r::Robot, moves)
    while length(moves)>0
        side=pop!(moves)
        move!(r,inverse(side))
    end 
end 


