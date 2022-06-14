### aws-ghost
![dev](https://github.com/phillhocking/aws-ghost/actions/workflows/tflint-dev.yml/badge.svg?branch=dev) ![main](https://github.com/phillhocking/aws-ghost/actions/workflows/tflint-main.yml/badge.svg)

I started my Terraform adventure nearly three years ago with the goal of deploying the Ghost CMS to EC2 and you would not even believe as a newcomer to Cloud/Dev Ops and CI/CD pipelines how much of a ride I was in for. I came back to this project after hitting a pretty big wall with it and it is actually pretty remarkable how much I still struggled with it even with all the fancy new AWS services, like Lightsail, that are specifically intended for quickly prototyping/deploying/set-and-forget 'simple' hosting for stuff like personal blogs and MVP/test environments and the like. 

I certainly learned a lot of fun lessons, but you would not believe the thousands of blog posts with random little code snippets and half of what I was actually trying to do that just looked like fodder for 'look ma, I have marketable tech skills and really care about this stuff so give me a job as a full stack developer please! Gosh, after a 20y ops career not even being able to code my way out of a bag and the ugliest little bash scripts you ever did see amounting to all of my 'coding' experience before going on this journey... well... I really needed a **lot** of help to even wrap my head around these concepts.  

Because so many of these concepts are really esoteric and end up in the StackOverflow or wonky Git commit messages that you intend on squashing later to make it look all neat and professional, demonstrate to the world you are competent, and try to summarize it all into as few words as possible... well, that doesn't work for me. This shit is hard, man!  I wanted to make sure that my run at this problem was comprehensive and most of all that someone else could get this up and going with relatively little effort - so after I finally worked out the kinks enough that I trusted the idempotence, I unleashed it upon a friend who is trying to get into a technology career and walked them not just through the vagaries of Terraform, Git, CI/CD workflows, and an IDE - we streamed the experience and you will find links to the videos (my internet cut out for a minute) below demonstrating the wailing, gnashing of teeth, and even some time just pontificating about the vagaries of life and tech. If a single person watcches this I will be impressed, but it is a real jump-start on getting up and running with enough knowledge to be dangerous and start tinkering with the skills people really want you to have. 
***
# Youtube Videos with detailed descriptions of the tooling and setting up environments/pipelines

These first two are a little more in-depth and go into configuring many tools that are helpful for developers along with suggestions for effectively working on projects: 


[First Take with Cat](https://www.youtube.com/watch?v=yZQTgDTm0OU)

[Second Bit with Cat](https://www.youtube.com/watch?v=8Sro-i-HaFM)

This one is much shorter and more 'meat and potatoes' but has a lot less information and explanations about particulars

[One More Time with FEELING with Meg](https://www.youtube.com/watch?v=LIWWjjpW_bs)

***
I don't have any illusions I'm going to be winning a Capture-the-Flag or working at a FAANG type place freaking ever lol, but I do know these technologies are not going away and I have spent years of my life now trying to become a "cloud/dev ops practitioner" to pretty much no avail, honestly. There's just such a vertical learning curve and what I like to call infinite recursion of infinite dependencies that it takes to even OODA yourself into a position where these practices can help your deployments or the organization you are at, but so very few of us are spending time in community with each other working together to try and solve the knowledge and learning problems that leads to the huge workforce shortage with the interest rate up and the stock market down as Hank Jr. would say. 

I'm never going to be a Twitch affiliate or make $5 from YouTube, but I'm trying to create cool content on my website https://www.phillhocking.com and stream/archive just the process of doing the work mostly on https://www.youtube.com/phillhocking and I would love to help you with your stuff if you think I could. There's a super cool Discord community where I found the kind of camaraderie, patience, and selfless acts of kindness that I remember used to be so fun and awesome about the internet, but now going to even support communities by big organizations with billions of dollars... you can't ever find people who are willing to talk you through a problem. God, the Hashicorp Terraform Gitter is probably the worst example of this I can fathom. 
***

[Here is an invite to the Discord community - The DevOps Lounge](https://discord.gg/MTzBvSS
) - that has been so helpful for me, and I hope that you show up there and just engage in fellowship with other technologists and enthusiasts regardless of your skill level. Even though I hardly can hold a candle to millions of folks doing this work, there really are only a few million out of a few billion who could even tell you what a CDN is or why you want to have an application stack fronted by one and regularly updated by folks with engineering resources like Amazon/Bitnami, or why it is so much easier to maintain/redeploy/maintain high levels of service and scalability by using these technologies. At least, if there really are a deluge of y'all, I'm sure not finding them on Stack Overflow or Gitter! :D

So welcome to my content, I hope my lighthearted and irreverent while frequently vulgar/downright silly antics and long autistic rants about things nobody except unixbeards care about is the sort of thing that will get three viewers in a four hour stream, and that maybe someone will find the "Phill's Notes" version of how to do things like install Git for Windows, use CLI tools inside a terminal, set up Terraform Cloud workspaces, and even register a domain is something that can be useful for you, because everyone out there making bay area salaries grinding it out don't have the time to hold my hand and tiptoe through the tulips with me, which is why I have taken years to even have something worth putting out there that I am somewhat proud of. 

And the clunky bullshit where there has to be an external `A` record in public dns... for chrissakes Amazon, or someone who is more clever than me, please figure all of that out!? When I saw that Lightsail had a Ghost blueprint I thought that would be way the hell easier than trying to template a template with Terraform (not a configuration management tool) or try and run Saltstack on the public internet or a masterless setup, plus, I can't Jinja at all but can kinda Terraform... so like, I ended up taking the most circuitous and time-wasting route to find that you can't even use a Lightsail resource with the compute.internal dns and I'll be damned if I was going to give up on Cloudfront or try to add VPC peering/whatever to this whole stack of nonsense I barely managed to kick off. 

Hit me up with questions, please dear God send helpful PRs that might teach me how to not be a complete buffoon after years of doing this, and on the really really real... hit me up and see if I can help you with your stuff just so I can go through the process of learning. I didn't squash my commits so everyone can see how many millions of hours I wasted of my life to get to this point lol!

***


# Instructions for configuring the Bitnami Lightsail instance after instantiation: 

***
```
The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
       ___ _ _                   _
      | _ |_) |_ _ _  __ _ _ __ (_)
      | _ \ |  _| ' \/ _` | '  \| |
      |___/_|\__|_|_|\__,_|_|_|_|_|

  *** Welcome to the Bitnami Ghost 3.41.5-0                    ***
  *** Documentation:  https://docs.bitnami.com/aws/apps/ghost/ ***
  ***                 https://docs.bitnami.com/aws/            ***
  *** Bitnami Forums: https://community.bitnami.com/           ***

#######################################################
###    For frequently used commands, please run:    ###
###         sudo /opt/bitnami/bnhelper-tool         ###
#######################################################

bitnami@ip-172-26-18-110:~$ cat bitnami_credentials
Welcome to the Bitnami Ghost Stack

******************************************************************************
The default username and password is 'user@example.com' and 'S0m3Pa$$w0rD'.
******************************************************************************

You can also use this password to access the databases and any other component the stack includes.

Please refer to https://docs.bitnami.com/ for more details.

bitnami@ip-172-26-18-110:~$ cd /opt/bitnami/
bitnami@ip-172-26-18-110:/opt/bitnami$ sudo ./bncert-tool
An updated version is available. Would you like to download it? You would need to run it manually later. [Y/n]: y

The tool will exit now. To run the updated version run the following command:

/opt/bitnami/bncert-tool

bitnami@ip-172-26-18-110:/opt/bitnami$ sudo ./bncert-tool
----------------------------------------------------------------------------
Welcome to the Bitnami HTTPS Configuration tool.

----------------------------------------------------------------------------
Domains

Please provide a valid space-separated list of domains for which you wish to
configure your web server.

Domain list []: my-external-A-record.fqdn.tld

The following domains were not included: www.my-external-A-record.fqdn.tld. Do you want to add them? [Y/n]: n

Warning: No www domains (e.g. www.example.com) or non-www domains (e.g. www.example.com) have been provided, so the following redirections will be
disabled: non-www to www, www to non-www.
Press [Enter] to continue:
----------------------------------------------------------------------------
Enable/disable redirections

Please select the redirections you wish to enable or disable on your Bitnami
installation.



Enable HTTP to HTTPS redirection [Y/n]: y


----------------------------------------------------------------------------
Changes to perform

The following changes will be performed to your Bitnami installation:

1. Stop web server
2. Configure web server to use a free Let's Encrypt certificate for the domains:                                                                                                                                                             
my-external-A-record.fqdn.tld
3. Configure a cron job to automatically renew the certificate each month
4. Configure web server name to: my-external-A-record.fqdn.tld
5. Enable HTTP to HTTPS redirection (example: redirect http://my-external-A-record.fqdn.tld 
to https://my-external-A-record.fqdn.tld)
6. Start web server once all changes have been performed



Do you agree to these changes? [Y/n]: y


----------------------------------------------------------------------------
Create a free HTTPS certificate with Let's Encrypt

Please provide a valid e-mail address for which to associate your Let's Encrypt
certificate.

Domain list: my-external-A-record.fqdn.tld

Server name: my-external-A-record.fqdn.tld

E-mail address []: phillhocking@gmail.com

The Let's Encrypt Subscriber Agreement can be found at:

https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf

Do you agree to the Let's Encrypt Subscriber Agreement? [Y/n]: y


----------------------------------------------------------------------------
Performing changes to your installation

The Bitnami HTTPS Configuration Tool will perform any necessary actions to your
Bitnami installation. This may take some time, please be patient.

----------------------------------------------------------------------------
Success

The Bitnami HTTPS Configuration Tool succeeded in modifying your installation.

The configuration report is shown below.

Backup files:
* /opt/bitnami/apache2/conf/httpd.conf.back.202106221417
* /opt/bitnami/apache2/conf/bitnami/bitnami-apps-prefix.conf.back.202106221417
* /opt/bitnami/apache2/conf/bitnami/bitnami.conf.back.202106221417

Find more details in the log file:

/tmp/bncert-202106221417.log

If you find any issues, please check Bitnami Support forums at:

https://community.bitnami.com

Press [Enter] to continue:

sudo vi /opt/bitnami/apps/ghost/conf/httpd-app.conf

*** Add this line to the top of the document ***

RequestHeader set X-Forwarded-Proto "https"

*** Esc+ZZ unless you emacs lolol ***

bitnami@ip-172-26-18-110:/opt/bitnami$ 
bitnami@ip-172-26-18-110:/opt/bitnami$ cd apps/ghost/htdocs/
bitnami@ip-172-26-18-110:/opt/bitnami/apps/ghost/htdocs$ ghost config url https://my-blog-url-matching-the-cloudfront-acm-cert.tld


bitnami@ip-172-26-18-110:/opt/bitnami/apps/ghost/htdocs$ sudo /opt/bitnami/ctlscript.sh restart
Syntax OK
/opt/bitnami/apache2/scripts/ctl.sh : httpd stopped
✔ Stopping Ghost: 127-0-1-1
/opt/bitnami/apps/ghost/scripts/ctl.sh : ghost stopped
/opt/bitnami/mysql/scripts/ctl.sh : mysql stopped
/opt/bitnami/mysql/scripts/ctl.sh : mysql  started at port 3306
ℹ Ensuring user is not logged in as ghost user [skipped]
ℹ Checking if logged in user is directory owner [skipped]
✔ Checking current folder permissions
✔ Validating config
✔ Checking memory availability
✔ Checking binary dependencies
✔ Starting Ghost: 127-0-1-1 

------------------------------------------------------------------------------

Your admin interface is located at:

    https://my-external-A-record.fqdn.tld/ghost/    
```
