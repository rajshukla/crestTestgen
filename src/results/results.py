import xlsxwriter
import sys

workbook = xlsxwriter.Workbook('results.xlsx')
worksheet = workbook.add_worksheet(sys.argv[1])	

worksheet.set_column('A:A', 20)

bold = workbook.add_format({'bold': True})

worksheet.write('A1', 'FILENAME:- '+ sys.argv[1], bold)
worksheet.write('A2', "STRATEGY:- "+sys.argv[3], bold)
worksheet.write('A3', 'ITERATIONS:- '+ sys.argv[2], bold)

info=open("result.txt","r");
resultData=info.readlines();

numIterations=int(sys.argv[2])

numFunctions=int(resultData[numIterations].split()[0])
totalBranches=int(resultData[numIterations].split()[1])

worksheet.write('A5', 'FUNCTIONS:- '+ str(numFunctions))
worksheet.write('A6', 'BRANCHES:- '+ str(totalBranches))

worksheet.write('A8', 'ITERATIONS',bold)

worksheet.set_column('B:B', 25)
worksheet.write('B8', 'BRANCHES COVERED',bold)

worksheet.set_column('C:C', 30)
worksheet.write('C8', 'COVERAGE PERCENTAGE',bold)

worksheet.set_column('D:D', 20)
worksheet.write('D8', 'TEST CASES',bold)

for i in range(0,numIterations):
	temp=8+i+1;
	tempBranches=int(resultData[numIterations-i-1].split()[1])
	percentage=tempBranches*100.0/totalBranches
	worksheet.write("A"+str(temp),i+1)
	worksheet.write("B"+str(temp),tempBranches)
	worksheet.write("C"+str(temp),round(percentage,2))
	inputs=open("input."+str(i+1),"r")
	#worksheet.write("D"+str(temp), i+1,bold)
	j=1
	for line in inputs:
		worksheet.write(str(chr(ord('C')+j))+str(temp), int(line.split()[0]))
		j=j+1


worksheet.write('C4', 'FINAL COVERAGE:- '+str(round(percentage,2))+'%',bold)

workbook.close()
