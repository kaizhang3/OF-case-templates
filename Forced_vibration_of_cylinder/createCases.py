import os,numpy, sys, shutil, tempfile, math
fst = 0.185 
for theta in [0]:
    dir1 = 'Theta'+str(theta)
    #os.mkdir(dir1)
    os.chdir(dir1)
    for A in [0.4]:
        dir2 = 'A'+str(A)
        os.mkdir(dir2)
        os.chdir(dir2)
        Ax = A*math.cos(theta*math.pi/180)
        Ay = A*math.sin(theta*math.pi/180)
        #for f in numpy.arange(0.5,2.6,0.1):
        for f in [0.58,0.6,0.96,1,1.5,2,2.5]:
            dir3 = 'f'+format(f, '.10g')
            shutil.copytree('../../source', dir3)
            os.chdir(dir3)
            file1 = open('STEP2.sub', 'r')
            file2 = open('STEP2.sub2', 'w')
            for line in file1:
                file2.write(line.replace('??',str(A)))
            file1.close()
            file2.close()
            os.remove('STEP2.sub')
            os.rename('STEP2.sub2','STEP2.sub')
                
            file1 = open('STEP2.sub', 'r')
            file2 = open('STEP2.sub2', 'w')
            for line in file1:
                file2.write(line.replace('!!',str(f)))
            file1.close()
            file2.close()
            os.remove('STEP2.sub')
            os.rename('STEP2.sub2','STEP2.sub')
                
            file1 = open('0/pointDisplacement','r')
            file2 = open('0/pointDisplacement2','w')
            for line in file1:
                file2.write(line.replace('!!', str(f*fst*2*math.pi)))
            file1.close()
            file2.close()
            os.remove('0/pointDisplacement')
            os.rename('0/pointDisplacement2', '0/pointDisplacement')
            
            file1 = open('0/pointDisplacement','r')
            file2 = open('0/pointDisplacement2','w')
            for line in file1:
                file2.write(line.replace('??', '('+str(Ax)+' '+str(Ay)+' 0)'))
            file1.close()
            file2.close()
            os.remove('0/pointDisplacement')
            os.rename('0/pointDisplacement2', '0/pointDisplacement')
            os.chdir("..")
        os.chdir("..")
    os.chdir("..")
    
    
