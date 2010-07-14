package umk.net.slafs.domain.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import umk.net.slafs.domain.Godziny;

public class GodzinyValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Godziny.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Godziny g = (Godziny) target;
		if (g.getHours() > 90) {
			errors.rejectValue("hours", "error.toobigvalue");
		}
		
		if (g.isFuture()) {
			errors.rejectValue("whenWorked", "error.futuredate");
		}
		
		if (!g.isEditable()) {
			errors.rejectValue("whenWorked", "error.tooolddate", new Object [] {Godziny.DAYS_BACK}, "");
		}
	}
}
