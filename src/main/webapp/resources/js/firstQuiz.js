var studentSelectedGoal;

function goToDashboard() {

    var userGender,
        userCountry,
        userAge,
        userFirstname,
        userGoal;

    if ($('.genderMale').hasClass("active")) {
        userGender = "Male";
    } else {
        userGender = "Female";
    }

    userCountry = document.getElementById("country").value;
    userAge = parseInt(document.getElementById("intLimitTextBox").value);
    userFirstname = document.getElementById("intLimitTextBox2").value;
    userGoal = studentSelectedGoal;

    $.ajax({
        type: "GET",
        url: "./firstQuizAnswers?studentGender=" + userGender + "&studentCountry=" + userCountry + "&studentAge=" + userAge + "&studentName=" + userFirstname + "&studentGoal=" + userGoal,
        success: function (data, status) {
            location.replace("./dashboard");
        }
    });
}

function takeStudentSelectedGoal(id, value) {
    studentSelectedGoal = value;
    console.log("Student Selected Goal : " + studentSelectedGoal);
}

function validateStudentAge() {

    var studentAge = parseInt(document.getElementById("intLimitTextBox").value);

    if (studentAge < 6) {
        alert("It seems that you are too young for that application");
        document.getElementById('ageNextButton').style.opacity = "0.4";
        document.getElementById('ageNextButton').style.pointerEvents = "none";
    } else {
        document.getElementById('ageNextButton').style.opacity = "1";
        document.getElementById('ageNextButton').style.pointerEvents = "all";
    }

    if (studentAge > 12) {
        alert("It seems that you are too old for that application");
        document.getElementById('ageNextButton').style.opacity = "0.4";
        document.getElementById('ageNextButton').style.pointerEvents = "none";
    } else {
        document.getElementById('ageNextButton').style.opacity = "1";
        document.getElementById('ageNextButton').style.pointerEvents = "all";
    }

}