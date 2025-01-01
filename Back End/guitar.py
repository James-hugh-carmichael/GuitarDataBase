from flask import Flask, render_template, jsonify
import sqlite3

app = Flask(__name__)

def get_data():
    # Make sure this path is correct
    connection = sqlite3.connect(r'C:\Users\carmi\OneDrive\Desktop\Code\Projects\GuitarDataBase\Database\my_database.db')

    cursor = connection.cursor()
    cursor.execute("SELECT note_id, name FROM Notes")  # Use the correct column names
    rows = cursor.fetchall()
    connection.close()
    return rows

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/notes')
def notes():
    data = get_data()
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
