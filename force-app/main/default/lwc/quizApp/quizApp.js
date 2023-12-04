import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {

    selected={} // object to store all selected answers
    correctAnswers = 0
    isSubmitted = false 
    passed = false;
    
    myQuestions = [
        {
            id:"Q1",
            question:"Which one of the following is not a template loop?",
            answers: {
                a:"for:each",
                b:"iterator",
                c:"map loop"
            },
            correctAnswer:"c"
        },
        {
            id:"Q2",
            question:"Which of the file is invalid in LWC component folder?",
            answers: {
                a:".svg",
                b:".apex",
                c:".js"
            },
            correctAnswer:"b"
        },
        {
            id:"Q3",
            question:"Which one of the following is not a directive?",
            answers: {
                a:"for:each",
                b:"if:true",
                c:"@track"
            },
            correctAnswer:"b"
        }
    ]

    //used for disable submit button
    get allNotSelected() {
        return !(Object.keys(this.selected).length === this.myQuestions.length)
    }

    get isScoredFull() {
         return `slds-text-heading_large slds-align_absolute-center ${this.myQuestions.length === this.correctAnswers? 'slds-text-color_success':'slds-text-color_error' } `
    }
    // changeHandler get's called on every click on the options
    changeHandler(event) {
        const name = event.target.name
        const value = event.target.value

        // console.log("name", event.target.name)
        // console.log("value",  event.target.value)
        
        this.selected={...this.selected,[name]:value}
        // console.log(JSON.stringify(this.selected));
    }
    // form submit handler
    submitHandler(event) {
        event.preventDefault()
        let correct = this.myQuestions.filter(item => this.selected[item.id] === item.correctAnswer )
        this.correctAnswers = correct.length
        this.isSubmitted = true
        // console.log(this.correctAnswers);
        // console.log('correct: ', JSON.stringify(this.correct));
        console.log('correctAnswers',this.correctAnswers);
        this.passed = this.correctAnswers >= 2;
        console.log('passed',this.passed);
    }

    //form reset handler
    resetHandler(event) {
        
        this.isSubmitted = false
        this.selected = {}
        this.correctAnswers = 0
    }
    
    
}