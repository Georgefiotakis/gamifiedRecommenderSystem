var answerOne;
var answerTwo;
var answerThree;
var answerFour;
var answerFive;
var lessonOneCompleted;
var lessonTwoCompleted;
var lessonThreeCompleted;

// $("#customFile").change(function () {
//     filename = this.files[0].name
// });

var minutesLabel = document.getElementById("minutes");
var secondsLabel = document.getElementById("seconds");
var totalSeconds = 0;
setInterval(setTime, 1000);

function setTime() {
    ++totalSeconds;
    secondsLabel.innerHTML = pad(totalSeconds % 60);
    minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));
}

function pad(val) {
    var valString = val + "";
    if (valString.length < 2) {
        return "0" + valString;
    } else {
        return valString;
    }
}

function saveAnswerOne(id, value) {
    answerOne = value;
    console.log("Selected Answer One : " + answerOne);
}

function saveAnswerTwo(id, value) {
    answerTwo = value;
    console.log("Selected Answer Two : " + answerTwo);
}
function saveAnswerThree(id, value) {
    answerThree = value;
    console.log("Selected Answer Three : " + answerThree);
}
function saveAnswerFour(id, value) {
    answerFour = value;
    console.log("Selected Answer Four : " + answerFour);
}
function saveAnswerFive(id, value) {
    answerFive = value;
    console.log("Selected Answer Five : " + answerFive);
}

const correctAnswers = ['Operating System','1880s', 'Animation movie file', 'Field', 'Database'];
var result = document.querySelector('.result');

function validateAnswersForLessonOne() {

    var totalCorrect = 0;
    var totalAnswers = 5;
    var userAnswer = [];

    userAnswer.push(answerOne);
    userAnswer.push(answerTwo);
    userAnswer.push(answerThree);
    userAnswer.push(answerFour);
    userAnswer.push(answerFive);

    let score = 0;

    userAnswer.forEach((answer, index) =>{

        if(answer === correctAnswers[index]){
            score +=20;
            totalCorrect++;
        }
    });

    lessonOneCompleted = true;

    $.ajax({
        type: "GET",
        url: "./categoryOneLessonOne?userCoins=" + score + "&lessonCompleted=" + lessonOneCompleted,
        success: function (data, status) {
            location.replace("./dashboard");
        }
    });

    // var modal = document.getElementById("myModal");
    // var labelCorrectAnswers = document.getElementById("totalCorrectAnswers").innerHTML = "Your correct answers are : " + totalCorrect + "/" + totalAnswers;
    // var labelGainedCoins = document.getElementById("gainCoins").innerHTML = "You gain : " + score + "XP points";

    var span = document.getElementsByClassName("close")[0];

    // modal.style.display = "block";
    // span.onclick = function() {
    //     modal.style.display = "none";
    // }

    // window.onclick = function(event) {
    //     if (event.target == modal) {
    //         modal.style.display = "none";
    //     }
    // }

    // scrollTo(0, 0);
    // result.classList.remove('d-none');
    // let output = 0;
    // var timer = setInterval(()=>{
    //     result.querySelector('span').textContent = `${output}%`;
    //     if(output === score){
    //         clearInterval(timer);
    //     }else{
    //         output++;
    //     }
    // }, 10)
    // console.log(score);
}

function saveLessonOneCategoryOne() {

}