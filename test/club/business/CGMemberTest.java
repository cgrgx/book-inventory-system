/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package club.business;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author chira
 */
public class CGMemberTest {


    /**
     * Test of getFullName method, of class Member.
     */
    @Test
    public void testGetFullName() {
        System.out.println("getFullName");
        //arrange
        Member instance = new Member();
        String expResult = "Bob Murach";
        //act
        instance.setFullName(expResult);
        String result = instance.getFullName();
        //assert
        assertEquals(expResult, result);
    }

    /**
     * Test of getEmailAddress method, of class Member.
     */
    @Test
    public void testGetEmailAddress() {
        System.out.println("getEmailAddress");
        Member instance = new Member();
        String expResult = "murach@gmail.com";
        instance.setEmailAddress(expResult);
        String result = instance.getEmailAddress();
        assertEquals(expResult, result);
    }

    /**
     * Test of getPhoneNumber method, of class Member.
     */
    @Test
    public void testGetPhoneNumber() {
        System.out.println("getPhoneNumber");
        Member instance = new Member();
        String expResult = "2265071234";
        instance.setPhoneNumber(expResult);
        String result = instance.getPhoneNumber();
        assertEquals(expResult, result);
    }



    /**
     * Test of getProgramName method, of class Member.
     */
    @Test
    public void testGetProgramName() {
        System.out.println("getProgramName");
        Member instance = new Member();
        String expResult = "ITID";
        instance.setProgramName(expResult);
        String result = instance.getProgramName();
        assertEquals(expResult, result);
    }


    /**
     * Test of getYearLevel method, of class Member.
     */
    @Test
    public void testGetYearLevel() {
        System.out.println("getYearLevel");
        Member instance = new Member();
        int expResult = 2;
        instance.setYearLevel(expResult);
        int result = instance.getYearLevel();
        assertEquals(expResult, result);
    }


    /**
     * Test of isValid method, of class Member.
     */
    @Test
    public void testValidPositive() {
        System.out.println("isValid");
        Member instance = new Member("Murach Bob","murach@gmail.com");
        boolean expResult = true;
        boolean result = instance.isValid();
        assertEquals(expResult, result);
    }
    @Test
    public void testValidNegative() {
        System.out.println("isValid");
        Member instance = new Member("","");
        boolean expResult = false;
        boolean result = instance.isValid();
        assertEquals(expResult, result);
    }
    
}
