Select 	T.Technician, Total.TicketAmount as 'Total Tickets Currently Open', tc.TicketAmount as 'Total Tickets Closed This Week', 
		L1.TicketAmount as 'Level 1 Tickets Created This Week', C1.TicketAmount as 'Level 1 Tickets Closed This Week', 
		L2.TicketAmount as 'Level 2 Tickets Created This Week', C2.TicketAmount as 'Level 2 Tickets Closed This Week', 
		l3.TicketAmount as 'Level 3 Tickets Created This Week', C3.TicketAmount as 'Level 3 Tickets Closed This Week', 
		L4.TicketAmount as 'Level 4 Tickets Created This Week', C4.TicketAmount as 'Level 4 Tickets Closed This Week', 
		Project.TicketAmount as 'Project Tickets Created This Week', PC.TicketAmount as 'Project Tickets Closed This Week', 
		PM.TicketAmount as 'Preventative Maintenance Tickets Created This Week', PMC.TicketAmount as 'Preventative Maintenance Tickets Closed This Week'
  From BOSSASSIST_V_TICKET_MST T
  Left Join (Select technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
			    and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Severity = 'Level 1'
			  Group by Technician) as L1
    on T.Technician = L1.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
		       From BOSSASSIST_V_TICKET_MST
			  Where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
			    and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Status = 'Closed'
				and Severity = 'Level 1'
			  Group by Technician) as C1
    on T.Technician = C1.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
			    and DateCreated between '7/22/18' and '7/28/18 23:59:59'
			    and Status = 'Closed'
			    and Severity = 'Level 2'
			  Group by Technician) as C2
    on T.technician = C2.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Severity = 'Level 2'
			  Group by Technician) as L2
    on T.Technician = L2.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Severity = 'Level 3'
			  Group by Technician) as L3
    on T.Technician = l3.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Status = 'Closed'
				and Severity = 'Level 3'
			  Group by technician) as C3
    on T.Technician = C3.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Severity = 'Level 4'
			  Group by technician) as L4
    on T.Technician = L4.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Status = 'Closed'
				and Severity = 'Level 4'
			  Group by technician) as C4
    on t.Technician = C4.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and Status = 'Assigned'
				and (Severity = 'Level 1'or Severity = 'Level 2' Or Severity = 'Level 3' or Severity = 'Project')
			  Group by Technician) as Total
    on T.technician = Total.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Severity = 'Project'
			  Group by Technician) as Project
    on T.Technician = Project.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
		       From BOSSASSIST_V_TICKET_MST
			  Where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Status = 'Closed'
				and Severity = 'Project'
			  Group by technician) as PC
    on t.technician = PC.technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Status = 'Closed'
				and (Severity = 'Level 1'or Severity = 'Level 2' Or Severity = 'Level 3' Or Severity = 'Project')
			  Group by Technician) as tc
    on T.Technician = tc.Technician
  Left Join (Select Technician, COUNT(Ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  where [Technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Severity = 'Preventative Maintenance'
			  Group by technician) as PM
    on T.Technician = PM.Technician
  Left Join (Select Technician, COUNT(ticketid) as 'TicketAmount'
			   From BOSSASSIST_V_TICKET_MST
			  Where [technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
				and DateCreated between '7/22/18' and '7/28/18 23:59:59'
				and Status = 'Closed'
				and Severity = 'Preventative Maintenance'
			  Group by technician) as PMC
    on T.Technician = PMC.Technician
 Where [technicianid] in (3, 336, 333, 206, 74, 77, 79, 91, 93, 95, 101, 342, 454, 459, 371, 507)
 Group by T.Technician, Total.TicketAmount, tc.TicketAmount, L1.TicketAmount, C1.TicketAmount, L2.TicketAmount, 
		  C2.TicketAmount, L3.TicketAmount, C3.TicketAmount, L4.TicketAmount, C4.TicketAmount, Project.TicketAmount, 
		  PC.TicketAmount, PM.TicketAmount, PMC.TicketAmount
 Order by T.Technician asc
