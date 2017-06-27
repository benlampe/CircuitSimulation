function v = pulse(a,t)
t_adj = rem(t-a(3),a(7)) % time adjusted to beginning of cycle
if t_adj < 0 % during the initial delay
    v = a(1)
elseif t_adj < a(4) % during rise
    v = a(1) + (a(2)-a(1))*(t_adj/a(4))
elseif t_adj < (a(4) + a(6)) % during pulse
    v = a(2)
elseif t_adj < (a(4) + a(6) + a(5)) % during fall
    v = a(2) - (a(2)-a(1))*((t_adj - a(4) - a(6))/a(5))
else % during gap between pulses
    v = a(1)
end
end
