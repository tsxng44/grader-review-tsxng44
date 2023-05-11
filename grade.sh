CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'
cd student-submission

if [[ -f ListExamples.java ]]
then 
echo 'Valid Input'
else 
echo 'Invalid Input'
fi 

cp -r ListExamples.java ../grading-area
cd ..
cp -r TestListExamples.java grading-area
cp -r lib grading-area
cd grading-area

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
if [[ $? -eq 0 ]]
then
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
else
echo 'Compilation Error'
exit 1
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
