# Create your grading script here

set -e
CPATH=".:lib/hamcrst-core-1.3.jar:lib/junit-4.13.2.jar"
rm -rf student-submission
git clone $1 student-submission
cp ./TestListExamples.java student-submission
cd student-submission

if [[ ! -f ListExamples.java ]]
then
	echo "Does not contain file"
	exit 1
fi


javac -cp $CPATH *.java
if [[ ! $? -eq 0 ]]
then
	echo "Student files compile error"
	exit 2
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

