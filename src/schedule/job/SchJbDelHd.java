package schedule.job;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class SchJbDelHd implements ScheduelJobHandler {

	@Override
	@RequestMapping("/schJbDel")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws SchJbException {
		// TODO : 스케쥴 ...엄(민재야 뭐라고 달아야 할지 잘 모르겠다)
		return null;
	}

}
