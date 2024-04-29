;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  File name  : Eventify.clp
;;;  Purpose    : This CLIPS source file runs a program to determine a
;;;               location for the user based on their answers to
;;;               specific questions about their needs.
;;;  Project    : CMSI 627
;;;  Date       : 14-Feb-2024
;;;  Author     : Brittany, Christine, Alejandro, Subhraneel
;;;  Description: This program is just a simple question-and-answer
;;;                session, which will tell the user an event that they
;;;                can attend based on their specifications.
;;;
;;;  Operation  : This source file is intended to be run from the batch
;;;                file with the corresponding name.  To do this, in
;;;                the CLIPS environment, use the command:
;;;
;;;                   (batch Eventify.bat)
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Revision History:
;;;  -----------------
;;;
;;;   Ver      Date      Modified by:  Description
;;;  -----  -----------  ------------  ---------------------------------
;;;  1.0.0  14-Feb-2024  Brittany S.   Initial release and hosted to GitHub (see there for version control)
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a template for a location, containing slots for its
;;;  pertinent information.
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (deftemplate location
        (slot name (type STRING))
        (slot address (type STRING))
        (slot hours)
        (slot website)
        (slot description (type STRING))
        (slot region)
        (multislot price_range)
        (multislot group_size)
        (multislot energy_range)
        (slot foodAvailable)
        (slot alcoholAvailable)
        (slot musicAvailable)
        (slot wheelchairAccessible)
        (multislot category)
        (slot isIndoor)
    )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a list of locations, containing the appropriate attribute
;;;  data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (deffacts location-database 
      (location (name "Boardwalk11")
                     (address "10433 National Blvd Los Angeles, CA 90034")
                     (hours 5:00pm-2:00am)
                     (website Boardwalk11.com)
                     (description "indoor")
                     (region SoCal)
                     (price_range medium)
                     (group_size small medium large)
                     (energy_range medium)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor yes)
      )
      (location (name "The Grove")
                     (address "189 The Grove Dr, Los Angeles CA 90036")
                     (hours 10:00am-9:00pm)
                     (website Thegrovela.com)
                     (description "Retail and entertainment complex in Los Angeles.")
                     (region SoCal)
                     (price_range medium high)
                     (group_size small medium large)
                     (energy_range medium)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor no)
      )
      (location (name "Pier 39")
                     (address "The embarcadero, San Francisco CA 94133")
                     (hours 11:00am-9:00pm)
                     (website Pier39.com)
                     (description "Shopping center with attractions and live shows")
                     (region Bay-area)
                     (price_range low medium)
                     (group_size small medium large)
                     (energy_range medium high)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable no)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor no)
      )
      (location (name "Golden Gate Park")
                     (address "501 Stanyan St, San Francisco CA 94117")
                     (hours 6:00am-10:00pm)
                     (website Sfrecpark.org)
                     (description "Large urban park consisting of 1,017 acres of public grounds")
                     (region Bay-area)
                     (price_range low medium)
                     (group_size small medium large)
                     (energy_range low medium)
                     (foodAvailable no)
                     (alcoholAvailable no)
                     (musicAvailable no)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor no)
      )
      (location (name "BigFoot West")
                     (address "10939 Venice Blvd, Los Angeles, CA 90064")
                     (hours 5pm-2am)
                     (website 1933group.com/bigfoot-west)
                     (description "A friendly neighborhood bar with a 'Cheers'-like sensibility, this cozy log cabin transports eager Angelenos to grandpa's cabin at story time")
                     (region SoCal)
                     (price_range low)
                     (group_size small medium large)
                     (energy_range medium)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor yes)
      )
      (location (name "The Fillmore")
                     (address "1805 Geary Blvd, San Francisco, CA 94115")
                     (hours 10am-6pm)
                     (website livenation.com/venue/KovZpZAE6eeA/the-fillmore-events)
                     (description "The Fillmore is a historic music venue in San Francisco, California")
                     (region Bay-area)
                     (price_range high)
                     (group_size small medium large)
                     (energy_range medium)
                     (foodAvailable no)
                     (alcoholAvailable no)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor yes)
      )
      (location (name "Manhattan Beach Pier")
                     (address "2 Manhattan Beach Blvd, Manhattan Beach, CA 90266")
                     (hours 24hrs)
                     (website manhattanbeach.gov)
                     (description "Manhattan Beach Pier is a real gem to photograph as it has a photogenic red-roofed roundhouse at the end of it and turquoise colored steel railings running the length of it. Palm trees line the parking lot at the start of the pier to complete the scene")
                     (region SoCal)
                     (price_range low)
                     (group_size small medium large)
                     (energy_range low)
                     (foodAvailable no)
                     (alcoholAvailable no)
                     (musicAvailable no)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor no)
      )
      (location (name "Universal CityWalk")
                     (address "100 Universal City Plaza, Universal City, CA 91608")
                     (hours 11am-9pm)
                     (website universalstudioshollywood.com/web/en/us/things-to-do/lands/citywalk)
                     (description "Shops, bars and restaurants")
                     (region SoCal)
                     (price_range medium)
                     (group_size small)
                     (energy_range high)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor no)
      )
      (location (name "Oak Grove")
                     (address "3067 E Chevy Chase Drive, Glendale")
                     (hours request)
                     (website thebash.com/profiles/chevy-chase-country-club-oak-grove)
                     (description "private venue outdoors")
                     (region SoCal)
                     (price_range medium)
                     (group_size medium)
                     (energy_range low)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable request)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor no)
      )
      (location (name "K1 Indoor Karting Burbank")
                     (address "960 Chestnut st., Burbank, CA 91506")
                     (hours 12pm-10pm)
                     (website k1speed.com/burbank-location.html)
                     (description "Karting for kids and adults, 1 challening indoor track and space for a fun or formal event")
                     (region SoCal)
                     (price_range high)
                     (group_size medium)
                     (energy_range high)
                     (foodAvailable request)
                     (alcoholAvailable request)
                     (musicAvailable no)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor yes)
      )
      (location (name "Academy")
                     (address "6021 Hollywood Blvd, Los Angeles, CA 90028")
                     (hours request)
                     (website academy.la)
                     (description "")
                     (region SoCal)
                     (price_range medium)
                     (group_size small medium large)
                     (energy_range high)
                     (foodAvailable no)
                     (alcoholAvailable yes)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor yes)
      )
      (location (name "Bubble World")
                     (address "1345 N. Montebello Boulevard, Montebello")
                     (hours 10am-9pm)
                     (website bubbleworldexperience.com/los-angeles/)
                     (description "Discover uniquely-themed rooms with plenty of photo opportunities in ball pits, VR tech, hot air balloon simulators and illusions")
                     (region SoCal)
                     (price_range medium)
                     (group_size small medium large)
                     (energy_range medium high)
                     (foodAvailable request)
                     (alcoholAvailable request)
                     (musicAvailable request)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor yes)
      )
      (location (name "Disneyland")
                     (address "Anaheim, CA 92802")
                     (hours 8am-12am)
                     (website https://disneyland.disney.go.com/)
                     (description "Amusement park in Anaheim, California, featuring characters, rides, and shows based on the creations of Walt Disney and the Disney Company")
                     (region SoCal)
                     (price_range high)
                     (group_size small medium large)
                     (energy_range high)
                     (foodAvailable yes)
                     (alcoholAvailable no)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor no)
      )
      (location (name "Joshua Tree National Park")
                     (address "74485 National Park Dr, Twentynine Palms, CA 92277")
                     (hours 24hrs)
                     (website nps.gov/jotr)
                     (description "A stunning national park famous for its unique desert landscape and rock formations, offering hiking, rock climbing, and stargazing.")
                     (region SoCal)
                     (price_range low)
                     (group_size small medium large)
                     (energy_range high)
                     (foodAvailable no)
                     (alcoholAvailable no)
                     (musicAvailable no)
                     (wheelchairAccessible no)
                     (category casual)
                     (isIndoor no)
      )
      (location (name "Yosemite Valley Lodge")
                     (address "9006 Yosemite Lodge Drive, Yosemite National Park, CA 95389")
                     (hours 24hrs)
                     (website yosemitepark.com)
                     (description "Lodge offering comfortable accommodations, dining options, and breathtaking views of Yosemite Valley")
                     (region NorCal)
                     (price_range low)
                     (group_size small medium large)
                     (energy_range low)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor yes)
      )
      (location (name "House of Blues Anaheim")
                     (address "400 W Disney Way #337, Anaheim, CA 92802")
                     (hours 11am-12am)
                     (website houseofblues.com/anaheim)
                     (description "Iconic music venue featuring live performances, a restaurant serving Southern-inspired cuisine, and a lively bar.")
                     (region SoCal)
                     (price_range medium)
                     (group_size small medium large)
                     (energy_range medium)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable yes)
                     (wheelchairAccessible no)
                     (category casual formal)
                     (isIndoor yes)
      )
      (location (name "Whitechapel, SF")
                     (address "600 Polk St, San Francisco, CA 94102")
                     (hours 5pm-12am)
                     (website https://www.whitechapelsf.com/)
                     (description "Gin-focused cocktail lounge with globally inspired eats in expansive, ornate, Victorian-themed digs.")
                     (region Bay-area)
                     (price_range medium high)
                     (group_size small medium large)
                     (energy_range medium)
                     (foodAvailable yes)
                     (alcoholAvailable request)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category formal)
                     (isIndoor yes)
      )
      (location (name "The Barrel Room, SF")
                     (address "415 Sansome Street, San Francisco, CA 94111")
                     (hours 3pm-9pm)
                     (website https://www.barrelroomsf.com/)
                     (description "Take a unique culinary journey across America at The Barrel Room. Explore diverse flavors through our regional menus crafted with fresh, local ingredients.")
                     (region Bay-area)
                     (price_range medium high)
                     (group_size small medium large)
                     (energy_range medium)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual formal)
                     (isIndoor yes)
      )
      (location (name "Tahoe Club Crawl")
                     (address "31 US HWY 50, Stateline, NV 89449")
                     (hours 7:45pm-11pm)
                     (website https://tahoeclubcrawl.com/)
                     (description "Tahoe Club Crawl is a walking nightlife tour, hitting the hottest bars and nightclubs in South Lake Tahoe.")
                     (region NorCal)
                     (price_range high)
                     (group_size small medium large)
                     (energy_range high)
                     (foodAvailable yes)
                     (alcoholAvailable yes)
                     (musicAvailable yes)
                     (wheelchairAccessible yes)
                     (category casual)
                     (isIndoor yes)
      )
      (location (name "The Presidio SF")
                     (address "210 Lincoln Blvd, San Francisco, CA 94129")
                     (hours 24hrs)
                     (website https://presidio.gov/)
                     (description "Whether your vibe is nature, San Francisco history, or play, you’ll find something to do among the Presidio’s top attractions. The 1,491-acre park offers everything from ocean-side hikes to outdoor art exhibits to free family activities. There’s also a regular lineup of events.")
                     (region Bay-area)
                     (price_range medium)
                     (group_size small medium large)
                     (energy_range low)
                     (foodAvailable yes)
                     (alcoholAvailable no)
                     (musicAvailable yes)
                     (wheelchairAccessible no)
                     (category casual)
                     (isIndoor no)
      )
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine the group size from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-group_size 
      (not (group_size ?))
   =>
      (printout t "What is your group size? "crlf
                  "(0-30: small; 30-50: medium; >50: large)" crlf
                  "=> ")
      (assert (group_size (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine the price_range range from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-price_range
      (not (price ?))
   =>
      (printout t "What is your price range?" crlf
                  "(Type low, medium, or high)" crlf
                  "=> ")
      (assert (price (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine the energy_range level from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-energy_range
      (not (energy ?))
   =>
      (printout t "What energy level are you looking for?" crlf
                  "(Type low, medium, or high)" crlf
                  "=> ")
      (assert (energy (read)))
   )
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to accept the region from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-region
      (not (region ?))
   =>
      (printout t "What is region of your event?" crlf
                  "(Type NorCal, SoCal, or Bay-area)" crlf
                  "=> ")
      (assert (region (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to accept the category from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-category
      (not (category ?))
   =>
      (printout t "What is the category of your event?" crlf
                  "(Type formal or casual)" crlf
                  "=> ")
      (assert (category (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if the venue is indoor or outdoor from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-isIndoor
      (not (isIndoor ?))
   =>
      (printout t "Do you want the venue to be indoor?" crlf
                  "(Type yes or no)" crlf
                  "=> ")
      (assert (isIndoor (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if food is required by the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-foodAvailable
      (not (foodAvailable ?))
   =>
      (printout t "Do you need food to be available at the venue?" crlf
                  "(Type yes, no, or request)" crlf
                  "=> ")
      (assert (foodAvailable (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if alcohol is required by the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-alcoholAvailable
      (not (alcoholAvailable ?))
   =>
      (printout t "Do you need alcohol to be available at the venue?" crlf
                  "(Type yes, no, or request)" crlf
                  "=> ")
      (assert (alcoholAvailable (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if music is required the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-musicAvailable
      (not (musicAvailable ?))
   =>
      (printout t "Do you need music to be available at the venue?" crlf
                  "(Type yes, no, or request)" crlf
                  "=> ")
      (assert (musicAvailable (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if the user wants wheelchair accessibility at the venue
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-wheelchairAccessible
      (not (wheelchairAccessible ?))
   =>
      (printout t "Do you need wheechair accessibility at the venue?" crlf
                  "(Type yes or no)" crlf
                  "=> ")
      (assert (wheelchairAccessible (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong group_size value so that user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-group-size-entry "Ditch bogus group-size entries"
       ?f <- (group_size ~small & ~medium & ~large)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong price range value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-price-entry "Ditch bogus price entries"
       ?f <- (price ~low & ~medium & ~high)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong energy value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-energy-entry "Ditch bogus energy entries"
       ?f <- (energy ~low & ~medium & ~high)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong region value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-region-entry "Ditch bogus region entries"
       ?f <- (region ~SoCal & ~NorCal & ~Bay-area)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong category value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-category-entry "Ditch bogus category entries"
       ?f <- (category ~formal & ~casual)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong isIndoor value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-isIndoor-entry "Ditch bogus isIndoor entries"
       ?f <- (isIndoor ~yes & ~no)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong foodAvailable value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-foodAvailable-entry "Ditch bogus foodAvailable entries"
       ?f <- (foodAvailable ~yes & ~no & ~request)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong musicAvailable value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-musicAvailable-entry "Ditch bogus musicAvailable entries"
       ?f <- (musicAvailable ~yes & ~no & ~request)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong alcoholAvailable value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-alcoholAvailable-entry "Ditch bogus alcoholAvailable entries"
       ?f <- (alcoholAvailable ~yes & ~no & ~request)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong wheelchairAccessible value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-wheelchairAccessible-entry "Ditch bogus wheelchairAccessible entries"
       ?f <- (wheelchairAccessible ~yes & ~no)
      =>
       (retract ?f)
   )

;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to assert foodAvailable yes when user chooses foodAvailable
;;;    as request
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule set-foodAvailable
       "Assert foodAvailable yes when user chooses request"
       (foodAvailable request)
      =>
       (assert (foodAvailable yes))
	   ;(retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to assert musicAvailable yes when user chooses musicAvailable
;;;    as request
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule set-musicAvailable
       "Assert musicAvailable yes when user chooses request"
       (musicAvailable request)
      =>
       (assert (musicAvailable yes))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to assert alcoholAvailable yes when user chooses alcoholAvailable
;;;    as request
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule set-alcoholAvailable
       "Assert alcoholAvailable yes when user chooses request"
       (alcoholAvailable request)
      =>
       (assert (alcoholAvailable yes))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to assert foodAvailable request when user chooses foodAvailable
;;;    as yes
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule set-foodAvailableYes 
       "Assert foodAvailable yes when user chooses request"
       (foodAvailable yes)
      =>
       (assert (foodAvailable request))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to assert musicAvailable request when user chooses musicAvailable
;;;    as yes
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule set-musicAvailableYes
       "Assert musicAvailable yes when user chooses request"
       (musicAvailable yes)
      =>
       (assert (musicAvailable request))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to assert alcoholAvailable request when user chooses alcoholAvailable
;;;    as yes
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule set-alcoholAvailableYes 
       "Assert alcoholAvailable yes when user chooses request"
       (alcoholAvailable yes)
      =>
       (assert (alcoholAvailable request))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to output the result of the search
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule print-results
         (price ?price)
         (energy ?energy)
         (group_size ?group_size)
         (region ?region)
         (category ?category)
         (isIndoor ?isIndoor)
         (foodAvailable ?foodAvailable)
         (alcoholAvailable ?alcoholAvailable)
         (musicAvailable ?musicAvailable)
         (wheelchairAccessible ?wheelchairAccessible)
         (location (name ?name)
                   (address ?address)
                   (hours ?hours)
                   (website ?website)
                   (description ?description)
                   (price_range $? ?price $?)         
                   (energy_range $? ?energy $?)
                   (region ?region)
                   (category $? ?category $?)
                   (isIndoor ?isIndoor)
                   (foodAvailable ?foodAvailable)
                   (alcoholAvailable ?alcoholAvailable)
                   (musicAvailable ?musicAvailable)
                   (wheelchairAccessible ?wheelchairAccessible)
          )
         =>
         (printout t crlf crlf)
         (printout t "  You should go to " ?name ". Here are the details: " crlf)
         (printout t "  " ?address crlf)
         (printout t "  Hours: " ?hours crlf)
         (printout t "  Description: " ?description crlf)
         (printout t crlf crlf)
		   (assert (match matchFound))
   )

;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to output the result of the search
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
   (defrule print-noMatch "Display a message to user of there is no match"
         (not (match matchFound))
         =>
         (printout t crlf crlf)
         (printout t "Sorry! No matching location/venue found for the given inputs.")
         (printout t crlf crlf)
   )	




