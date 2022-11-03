def Print(y) : 
    for i in range(1, y+1) : 
        for j in range(1, y+1) : 
            if (j == 1 or j == y or i == j) : 
                print("X", end=" ")
            else : 
                print("O", end=" ")             
        print('') 

num = int(input("Enter the side of the square : "))
Print(num)