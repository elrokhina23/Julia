function main10!(::Robot)
    a = []
    summa = 0 
    side = Ost 
    while !isborder(r, Nord)
    moves!(r, side, a)
      if side == Ost
        side = West
      else
        side = Ost
      end
    end
    moves!(r, side, a)
    k = length(a)
    while length(a) > 0 
      summa += pop!(a)
    end
    println(summa/k)
  end
  
  function moves!(r::Robot, side, a)
    while !isborder(r, side)
      if ismarker(r)
        push!(a, temperature(r))
      end
      move!(r,side)
    end
    if !isborder(r, Nord)
      move!(r, Nord)
    end
  end
