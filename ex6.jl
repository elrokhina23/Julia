using HorizonSideRobots
function movess!(r::Robot, side::HorizonSide)
    counter = 0
    while isborder(r, side) == false
        counter += 1
        move!(r, side)
    end
    return counter
end

function  inverse(side::HorizonSide)
    HorizonSide(mod(Int(side) + 2, 4))
end


function let_it_snow(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r, side)
    end
end

function put(r::Robot)
    massX = []
    while isborder(r, West) == false || isborder(r, Sud) == false
        y = movess!(r, West)
        y_ = [y, West]
        push!(massX, y_)
        x = movess!(r, Sud)
        x_ = [x, Sud]
        push!(massX, x_)

        
    end
    #count_y = movess!(r, Nord)
    #wer(r, Sud, count_y)
    #count_x = movess!(r, Ost)
    #wer(r, West, count_x)
    h = [massX]
    return h
end


function back(r::Robot)
    qw = put(r::Robot)
    massX_2 = qw[1]
    massX_2 = reverse!(massX_2)
    for i in 1:length(massX_2)
        fcope = massX_2[i]
        fcope[2] = inverse(fcope[2])
        wer(r, fcope[2], fcope[1])
    end
end

function ftr(U::Bool)
    if U == true
        return false
    else
        return true
    end    
end

function  Ort_g(r::Robot, side1::HorizonSide, B::Bool)
    if B == true
        return HorizonSide(mod(Int(side1) + 3, 4))
    else
        return HorizonSide(mod(Int(side1) + 1, 4))
    end
end


function kr1(r::Robot, side::HorizonSide, num_steps::Int)
    for i in 1:num_steps
        while isborder(r, side) == true
            putmarker!(r)
            move!(r, Ort_g(r, side, true))
        end 
    end
    putmarker!(r)
    move!(r, side)
end

function kr2(r::Robot, side::HorizonSide)
    if side == Ost
        mass = [Ost, Nord, West, Sud]
        for side in 1:length(mass)
            kr1(r, mass[side], 1)
        end
    else
        mass = [West, Sud, Ost, Nord]
        for side in 1:length(mass)
            kr1(r, mass[side], 1)
        end
    end
end

function perimetr(r::Robot, side::HorizonSide)
    if side == Ost
        kr2(r, Ost)
        #while isborder(r, Ost) == true
        #    putmarker!(r)
        #    move!(r, Nord)
        #    if ismarker(r) == true
        #        break
        #    end
        #end
    else
        kr2(r, West)
        #while isborder(r, West) == true
        #    putmarker!(r)
        #    move!(r, Sud)
        #    if ismarker(r) == true
        #        break
        #    end
        #end
    end
end

function perimetr_small(r::Robot)#главная функция
    qw = put(r)

    count_y = movess!(r, Nord)
    let_it_snow(r, Sud, count_y)
    count_x = movess!(r, Ost)
    let_it_snow(r, West, count_x)

    mk = true
    side = Ost
    jk = true
    #snake:
    for i in 1:count_y
        for j in 1:count_x
            if isborder(r, side) == false
                if mk == true
                    move!(r, Ost)
                else
                    move!(r, West)
                end
            else
                if j != count_x
                    if mk == true
                        perimetr(r, Ost)
                        jk = false
                        break
                    else
                        perimetr(r, West)
                        jk = false
                        break
                    end
                end
            end
        end
        mk = ftr(mk)
        side = inverse(side)
        if jk == false
            break
        end
        if isborder(r, Nord) == false
            move!(r, Nord)
        else
            break
        end
    end

    movess!(r, Sud)
    movess!(r, West)

    massX_2 = qw[1]
    massX_2 = reverse!(massX_2)
    for i in 1:length(massX_2)
        fcope = massX_2[i]
        fcope[2] = inverse(fcope[2])
        let_it_snow(r, fcope[2], fcope[1])
        
    end
end