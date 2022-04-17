function [PV,PM]=updateprocedure(PV,PM,winner,loser,Np,Num_Features)
for i=1:Num_Features
    for j=i+1:Num_Features
        if winner(1,i)==0 && winner(1,j)==0 && loser(1,i)==0 && loser(1,j)==1
            PV(1,j)=PV(1,j)-Np;
            
        else if winner(1,i)==0 && winner(1,j)==0 && loser(1,i)==1 && loser(1,j)==0
                PV(1,i)=PV(1,i)-Np;
               
             else if  winner(1,i)==0 && winner(1,j)==0 && loser(1,i)==1 && loser(1,j)==1
                    PM(i,j)=PM(i,j)-Np;
                    PM(j,i)=PM(i,j);
                    
                    PV(1,i)=PV(1,i)-Np;
                    PV(1,j)=PV(1,j)-Np;
                else if winner(1,i)==0 && winner(1,j)==1 && loser(1,i)==0 && loser(1,j)==0
                        PV(1,j)=PV(1,j)+Np;
                     
                     else if winner(1,i)==0 && winner(1,j)==1 && loser(1,i)==1 && loser(1,j)==0
                                PV(1,i)=PV(1,i)-Np;
                                PV(1,j)=PV(1,j)+Np;
                            else if winner(1,i)==0 && winner(1,j)==1 && loser(1,i)==1 && loser(1,j)==1
                                    PM(i,j)=PM(i,j)-(2*Np);
                                    PM(j,i)=PM(i,j);
                                    PV(1,i)=PV(1,i)-Np;
                                    
                                else if winner(1,i)==1 && winner(1,j)==0 && loser(1,i)==0 && loser(1,j)==0
                                       PV(1,i)=PV(1,i)+Np; 
                                       
                                    else if winner(1,i)==1 && winner(1,j)==0 && loser(1,i)==0 && loser(1,j)==1
                                            PV(1,i)=PV(1,i)+Np;
                                            PV(1,j)=PV(1,j)-Np;
                                            
                                        else if winner(1,i)==1 && winner(1,j)==0 && loser(1,i)==1 && loser(1,j)==1
                                                PM(i,j)=PM(i,j)-(2*Np);
                                                PM(j,i)=PM(i,j);
                                                 
                                                PV(1,j)=PV(1,j)-Np;
                                              
                                            else if winner(1,i)==1 && winner(1,j)==1 && loser(1,i)==0 && loser(1,j)==0
                                                    PM(i,j)=PM(i,j)+Np;
                                                    PM(j,i)=PM(i,j);
                                                     
                                                    PV(1,i)=PV(1,i)+Np;
                                                    PV(1,j)=PV(1,j)+Np;
                                                    
                                                else if winner(1,i)==1 && winner(1,j)==1 && loser(1,i)==0 && loser(1,j)==1
                                                        PM(i,j)=PM(i,j)+(2*Np);
                                                        PM(j,i)=PM(i,j);
                                                        
                                                        PV(1,i)=PV(1,i)+Np;
                                                        
                                                    else if winner(1,i)==1 && winner(1,j)==1 && loser(1,i)==1 && loser(1,j)==0
                                                        PM(i,j)=PM(i,j)+(2*Np);
                                                        PM(j,i)=PM(i,j);
                                                        
                                                        PV(1,j)=PV(1,j)+Np;
                                                       
                                                    
                                                                                 
                                    
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                         end
                    end
                 end
            end
        end
    end
end

for i=1:Num_Features
    for j=1:Num_Features
             if PM(i,j)<0
                PM(i,j)=0.0001;
             end
    end
end
for i=1:Num_Features
    
            if PV(1,i)<0
                PV(1,i)=0.0001;
            end
end
end