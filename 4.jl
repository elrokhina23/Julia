using HorizonSideRobots

function let_it_snow(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r, side)
    end
end

function let_it_snow_color(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r, side)
        putmarker!(r)
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

function let_it_snow_and_make_snowballs(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
end



function snowman(r::Robot)

    S_co = movess!(r, Sud)
    W_co = movess!(r, West)
    weight_count = movess!(r, Nord)
    let_it_snow(r, Sud, weight_count)
    length_count = movess!(r, Ost)
    let_it_snow(r, West, length_count)

    one_side = length_count
    another_side = weight_count

    putmarker!(r)
    let_it_snow_and_make_snowballs(r, Ost)
    let_it_snow(r, West, length_count)
    while another_side > 0
        if isborder(r, Nord) == false
            move!(r, Nord)
        end
        putmarker!(r)
        one_side = one_side - 1
        let_it_snow_color(r, Ost, one_side)
        let_it_snow(r, West, one_side)
        another_side= another_side - 1
        
    end

    let_it_snow(r, Sud, weight_count)
    let_it_snow(r, Nord, S_co)
    let_it_snow(r, Ost, W_co )
end