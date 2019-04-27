package com.epam.app.util.password;

import org.passay.CharacterData;
import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Password {
    private static final PasswordGenerator gen = new PasswordGenerator();
    private static final CharacterData alphabeticals = EnglishCharacterData.Alphabetical;
    private static final CharacterData numerics = EnglishCharacterData.Digit;
    private static final CharacterRule AlphabeticalRule = new CharacterRule(alphabeticals);
    private static final CharacterRule NumericRule = new CharacterRule(numerics);

    private static final BCryptPasswordEncoder PASSWORD_ENCODER = new BCryptPasswordEncoder();

    static {
        AlphabeticalRule.setNumberOfCharacters(3);
        NumericRule.setNumberOfCharacters(3);
    }

    public static String generate() {
        return gen.generatePassword(6, AlphabeticalRule, NumericRule);
    }

    public static String hash(String password) {
        return PASSWORD_ENCODER.encode(password);
    }

    public static boolean matches(String rawPassword, String encodedPassword) {
        return PASSWORD_ENCODER.matches(rawPassword, encodedPassword);
    }

}
