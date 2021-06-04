select * from prethaler_customer;

CREATE OR REPLACE TRIGGER trg_prethaler_customer
BEFORE INSERT OR UPDATE ON prethaler_customer
FOR EACH ROW
DECLARE
BEGIN
  IF (:NEW.credits < 0) THEN
    RAISE_APPLICATION_ERROR(-69, 'The credits has to be greater or equal to 0');
  END IF;
  
  IF (:NEW.birthdate >= SYSDATE) THEN
    RAISE_APPLICATION_ERROR(-70, 'The birth date must be below the current date');
  END IF;
  
  IF (UPDATING AND :OLD.birthdate <> :NEW.birthdate) THEN
    RAISE_APPLICATION_ERROR(-71, 'The birthdate cannot be updated');
  END IF;
  
  IF (NOT REGEXP_LIKE(:NEW.email, '^[A-Za-z][A-Za-z0-9\.-]*@[A-Za-z]+\.[A-Za-z]+$')) THEN
    RAISE_APPLICATION_ERROR(-72, 'The email is not valid');
  END IF;
END;

CREATE OR REPLACE PROCEDURE proc_new_prethaler_customer(email IN VARCHAR2,
                                                        firstname IN VARCHAR2,
                                                        lastname IN VARCHAR2,
                                                        gender IN VARCHAR2,
                                                        birthdate IN DATE,
                                                        credits IN OUT NUMBER) IS
  customer_id NUMBER;
BEGIN
  customer_id := seq_customer_id.NEXTVAL;
  IF credits IS NULL THEN
    credits := 10;
  END IF;
  
  INSERT INTO prethaler_customer VALUES (_customer_id, email, firstname, lastname, gender, birthdate, credits);
END;
