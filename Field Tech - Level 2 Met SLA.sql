Select T.Technician, T.Total, m.Met, nm.[Not Met]
  From (Select Total.Technician, Count(Total.Hoursdiff) as 'Total'
          From (Select Technician, Ticketid, Datecreated, Lastupdated, DATEDIFF(Hour, Datecreated, Lastupdated) as Hoursdiff
                  From BOSSASSIST_V_TICKET_MST
                 Where Datecreated between '1/1/2018' and '6/30/2018' 
                   and Severity = 'Level 2'
                   and TechnicianId in (3, 336, 333, 206, 74, 77, 79, 91, 93, 101, 342, 454, 459, 371, 95, 507)) as Total
         Group by Total.Technician) as t
  Join (Select Met.Technician, Count(Met.Hoursdiff) as 'Met'
          From (Select Technician, Ticketid, Datecreated, Lastupdated, DATEDIFF(Hour, Datecreated, Lastupdated) as Hoursdiff
				  From BOSSASSIST_V_TICKET_MST
				 Where Datecreated between '1/1/2018' and '6/30/2018' 
				   and Severity = 'Level 2'
                   and TechnicianId in (3, 336, 333, 206, 74, 77, 79, 91, 93, 101, 342, 454, 459, 371, 95, 507)
               ) as Met
	     Where Met.Hoursdiff <= '24'
         Group by Met.Technician) as m
    on t.Technician = m.Technician
  Join (Select NotMet.Technician, Count(notmet.hoursdiff) as 'Not Met'
		  From (select Technician, Ticketid, Datecreated, Lastupdated, DATEDIFF(Hour, Datecreated, Lastupdated) as Hoursdiff
                  From BOSSASSIST_V_TICKET_MST
                 Where Datecreated between '1/1/2018' and '6/30/2018' 
                   and Severity = 'Level 2'
                   and TechnicianId in (3, 336, 333, 206, 74, 77, 79, 91, 93, 101, 342, 454, 459, 371, 95, 507)) as NotMet
                 Where NotMet.Hoursdiff >= '25'
                 Group by notmet.Technician) as nm
    on t.Technician = nm.Technician
