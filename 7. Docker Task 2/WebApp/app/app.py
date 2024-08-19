from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <h1>About Me</h1>
    <p>Name: ChatGPT</p>
    <p>Version: GPT-4</p>
    <p>Specialty: Language Model AI</p>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
