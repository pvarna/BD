select code, model, speed + ram + 10 * screen as rating
from laptop
order by rating desc, code