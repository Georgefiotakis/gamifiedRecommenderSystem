package gr.gfiotakis.imlCloud.model.gui;

public class StudentInfo {
    String gender;
    String Country;
    Integer age;
    String firstName;
    String studentGoal;

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String country) {
        Country = country;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getStudentGoal() {
        return studentGoal;
    }

    public void setStudentGoal(String studentGoal) {
        this.studentGoal = studentGoal;
    }
}
