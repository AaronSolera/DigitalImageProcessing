function P_ = MVDM(P)
	P = sort(P);
	P_ = P(2);
	if P(2) == 0
		P_ = P(3); 
	end
	if P(3) == 255
		P_ = P(1);
	end
end
