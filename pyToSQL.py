#!/usr/bin/env python3

import MySQLdb
from getpass import getpass
import csv
import sys
from tabulate import tabulate

# lista de linhas
def parse_csv(filename):
	file = open(filename, "r")
	data = list(csv.reader(file, delimiter=";"))
	file.close()
	return data

# lista dos nomes dos parametros, parsed como uma string
# coisas auto increment não são mantidas !!!!!!!!
def get_params(cursor, tablename):
	cursor.execute("DESC %s" % tablename)
	params = cursor.fetchall()
	final_params = []
	for i in params:
		if i[5] != "auto_increment":
			final_params.append(i[0])
	return final_params

# coisas auto increment não são mantidas !!!!!!!!
def get_params_with_type(cursor, tablename):
	cursor.execute("DESC %s" % tablename)
	params = cursor.fetchall()
	final_params = []
	for i in params:
		if i[5] != "auto_increment":
			final_params.append(i[:3])
	return final_params

# passa de [] para string
def parse_params(params):
	string = "("
	for param in params:
		string += param + ", "
	string = string[:-2] +  ")"
	return string


def insert_into_table_individual(cursor, tablename):
	print("Parameters:")

	try:
		print(tabulate(get_params_with_type(cursor, tablename), headers=['Nome', 'Tipo', 'Pode ser null']))
	except MySQLdb.ProgrammingError:
		print("Table probably does not exist")
		return

	try:
		params = get_params(cursor, tablename)
	except MySQLdb.ProgrammingError:
		print("Table probably does not exist")
		return

	input_data = []
	formatstr = "("
	for i in params:
		formatstr += "%s, "
		inputstr = input("Enter value for " + i + ": ")
		if inputstr == "":
			inputstr = "NULL"
		input_data.append(inputstr)
	formatstr = formatstr[:-2] +  ")"
	input_data = tuple(input_data)


	try:
		cmdstring = "INSERT INTO {} {} VALUES {}".format(tablename, parse_params(params), formatstr)
	except TypeError:
		print("Data types do not match, or not enough fields")
		return
	
	try:
		cursor.execute(cmdstring, input_data)
	except MySQLdb.OperationalError:
		print("Data types do not match")

if __name__ == "__main__":
	# Open database connection
	try:
		db = MySQLdb.connect(host="localhost",
							 user="root",
							 password="micomico123", # password
							 database="Ultimo_a_Saber")
	except MySQLdb.Error as e:
	    print("Error connecting")
	    sys.exit (1)

	# prepare a cursor object using cursor() method
	cursor = db.cursor()

	try:
		while True:
			table = input("Enter the table name: ")
			insert_into_table_individual(cursor, table)
			commit = input("Commit? (y/n): ")
			if commit == 'y':
				db.commit()
	except KeyboardInterrupt:
		db.close()
