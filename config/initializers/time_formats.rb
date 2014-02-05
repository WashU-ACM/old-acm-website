Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:month_day_year_words] = lambda{ |time| time.strftime("%B #{time.day}, %Y") }