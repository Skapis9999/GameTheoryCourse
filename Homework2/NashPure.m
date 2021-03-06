
function P = NashPure (A1, A2)
  [M1,M2] = size(A1); %Ο Α1 και ο Α2 έχουν τις ίδιες διαστάσεις

  %{
  θα φτιάξουμε 2 πίνακες που να βάλουμε τις θέσεις τον μεγίστον.
  Ο πίνακας Κ1 θα αποθηκεύει τις θέσεις των μεγίστων του Α1.
  Θα έχει παντού μηδενικά εκτός από τα σημεία των μεγίστων που θα έχει 1.
  %}

  K1 = [zeros(M1,M2)];
  K2 = [zeros(M1,M2)];
  (x) = max(A1);
  (y) = max(A2'); %θέλουμε να βρει τα μέγιστα σε κάθε σειρά και γιαύτο τρέχουμε την max για τον αντεστραμμένο

  for (i=1:M1)
      for(j=1:M2)
        if A1(i,j)==x(i)
          K1(i,j) = 1;
        end
        if A2(i,j)==y(i)
          K2(i,j) = 1;
        end
      endfor
  endfor

  S = K1 + K2; %Σε όσα σημεία ο πίνακας S έχει τον αριθμό 2 τότε εκείνο είναι καθαρό ΝΕ
  n=1; % απλά ένα βοηθητικό στοιχείο που θα μας βοηθήσει στο φτιάξιμο του πίνακα P

 %αρχικοποίηση του πίνακα P. Αν δεν έχουμε ΝΕ θα επιστρέφεται αυτός ο μηδενικός πίνακας
  P(1,1) = 0;
  P(1,2) = 0;

  for (i=1:M1)
      for(j=1:M2)
        if S(i,j)==2
          P(n,:) = [i j]; %Κάθε φορά που βρίσκουμαι σε μία θέση καθαρό ΝΕ αποθηκεύουμαι την θέση στον P ανά γραμμή
          n++;
        end
      endfor
  endfor


endfunction
