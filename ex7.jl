using HorizonSideRobots

function go_this_way(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
    end
end

function movess!(r::Robot, side::HorizonSide)
    counter = 0
    while isborder(r, side) == false
        counter += 1
        move!(r, side)
    end
    return counter
end

function let_it_snow(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r, side)
    end
end

function movepro(r::Robot, l::Bool, count_x::Int) 
    if l == true
        for i in 1:count_x
            if i % 2 == 0
                putmarker!(r)
                move!(r, Ost)
            else
                move!(r, Ost)
            end
        end
        move!(r, Ost)
        putmarker!(r)
    else
        for i in 1:count_x
            if i % 2 == 0
                move!(r, Ost)
            else
                putmarker!(r)
                move!(r, Ost)
            end
        end
    end
end

function let_it_go(r::Robot)
    count_y = movess!(r, Sud)
    count_x = movess!(r, West)
    y = movess!(r, Nord);wer(r, Sud, y)
    x = movess!(r, Ost);wer(r, West, x)
    for i in 1:y+1
        if i % 2 ==0
            movepro(r, false, x)
            go_this_way(r, West)
            if isborder(r, Nord) == true
                break
            else
                move!(r, Nord)
            end
        else
            movepro(r, true, y)
            go_this_way(r, West)
            if isborder(r, Nord) == true
                break
            else
                move!(r, Nord)
            end
        end
    end
    go_this_way(r, Sud)
    let_it_snow(r, Nord, count_y)
     
    let_it_snow(r, Ost, count_x)
end