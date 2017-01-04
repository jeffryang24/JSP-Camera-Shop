<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%!
public String email_regex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.com$";
public boolean isAlphaNumeric(String str){
	for(int i=0;i<str.length();i++){
		char c = str.charAt(i);
		if (!Character.isDigit(c) && !Character.isLetter(c)){
			return false;
		}
	}
	
	return true;
}

public boolean isNumeric(String str){
	for(int i=0;i<str.length();i++){
		char c = str.charAt(i);
		if (!Character.isDigit(c)){
			return false;
		}
	}
	
	return true;
}

public boolean isValidFullname(String str){
	for(int i=0;i<str.length();i++){
		char c = str.charAt(i);
		if (c == ' ') continue;	// ignore space
		if (!Character.isLetter(c)){
			return false;
		}
	}
	
	return true;
}

public boolean isValidPassword(String str){
	int hasUppercase = 0, hasLowercase = 0, hasDigit = 0, hasAlphabet = 0;
	for(int i=0;i<str.length();i++){
		char c = str.charAt(i);
		if (Character.isLowerCase(c)) hasLowercase++;
		if (Character.isUpperCase(c)) hasUppercase++;
		if (Character.isDigit(c)) hasDigit++;
		if (Character.isLetter(c)) hasAlphabet++;
	}
	
	if (hasUppercase > 0 && hasLowercase > 0 && hasDigit > 0 && hasAlphabet > 0){
		return true;
	}
	return false;
}

public boolean isValidBirthDate(String str){
	String[] strSplit = str.split("-");
	if (strSplit.length != 3) return false;
	// validasi dd
	for(char c : strSplit[0].toCharArray()){
		if (!Character.isDigit(c)) return false;
	}
	if (Integer.parseInt(strSplit[0]) < 1 || Integer.parseInt(strSplit[0]) > 31) return false;
	
	// validasi mm
	for(char c : strSplit[1].toCharArray()){
		if (!Character.isDigit(c)) return false;
	}
	if (Integer.parseInt(strSplit[1]) < 1 || Integer.parseInt(strSplit[1]) > 12) return false;
	
	// validasi yyyy
	for(char c : strSplit[1].toCharArray()){
		if (!Character.isDigit(c)) return false;
	}
	// acuan dari tahun 1000 - 9999
	if (Integer.parseInt(strSplit[2]) < 1000 || Integer.parseInt(strSplit[2]) > 9999) return false;
	
	// validasi tanggal yang dimasukkan valid dan eksis
	// perhatian! dd-mm-yyyy pada soal merupakan dd-MM-yyyy pada SimpleDateFormat
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	sdf.setLenient(false);
	try{
		Date dt = sdf.parse(str);
	}catch(Exception ex){
		return false;
	}
	return true;
}

public String GenerateURLParam(String str){
	return str.replace(' ', '+');
}
%>