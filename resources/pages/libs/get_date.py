from datetime import date

def get_start_date():
        today = date.today()
        #mm/dd/yyyy
        fdate = today.strftime("%d%m%Y")
        print(fdate)

        a_chars = []

        for number in fdate:
            a_chars.append(number)

        return a_chars
