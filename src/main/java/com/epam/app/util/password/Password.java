package com.epam.app.util.password;

/**
 * Created by vladd on 22.04.2019
 */
import org.passay.CharacterData;
import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;


public class Password {
    private static final PasswordGenerator gen = new PasswordGenerator();
    private static final CharacterData alphabeticals = EnglishCharacterData.Alphabetical;
    private static final CharacterData numerics = EnglishCharacterData.Digit;
    private static final CharacterRule AlphabeticalRule = new CharacterRule(alphabeticals);
    private static final CharacterRule NumericRule = new CharacterRule(numerics);

    static {
        AlphabeticalRule.setNumberOfCharacters(3);
        NumericRule.setNumberOfCharacters(3);
    }

    public static String generate() {
        return gen.generatePassword(6, AlphabeticalRule, NumericRule);
    }
}