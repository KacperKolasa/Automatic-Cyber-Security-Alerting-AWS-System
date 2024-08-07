# Manual Setup

## Setting up GuardDuty
First we want to setup GuardDuty, to do this we will launch the AWS console and in the search bar we will type in "GuardDuty":

<img src="https://i.imgur.com/jN2YbRq.jpeg"/>

Next we want to click that and proceed to enable the service for our AWS account, after which we should see the GuardDuty dashboard:

<img src="https://i.imgur.com/sLphTLH.jpeg"/>

## Setting up SNS
Now that we have GuardDuty, lets set up SNS (Simple Notification System). We will search for SNS in the search bar, after which we will be greeted by this screen:

<img src="https://i.imgur.com/0b90zKZ.jpeg"/>

We will type "GuardDuty-Alerts" in the Topic Name box and press next:

<img src="https://i.imgur.com/XoNfUEG.jpeg"/>

Now, we can see a range of different options that we can choose from, for this project we will leave everything as default and press Create Topic.

<img src="https://i.imgur.com/1lHS3Cv.jpeg"/>

Now we can see an overview of our topic, in which we will press the Create Subscription button at the buttom.

<img src="https://i.imgur.com/NYPGeta.jpeg"/>

We are now shown a page with different options for our subscription:

<img src="https://i.imgur.com/Cfc5Adt.jpeg"/>

We will choose our newly created topic as the topic ARN and for this protocol we will choose the Email protocol and enter our email address, however you are free to choose whichever protocol suit you best:

<img src="https://i.imgur.com/IXdsB7w.jpeg"/>

We now have to confirm our subscription email by clicking on the link sent to us by AWS.

## Setting up CloudWatch
Now, we want to go back to the search bar and type in CloudWatch and open it:

<img src="https://i.imgur.com/yUfO6PV.jpeg"/>

Next we will expand the Events menu on the sidebar and click on Rules.

<img src="https://i.imgur.com/aum33EV.jpeg"/>

Now we will click the Create Rule button at the bottom of the screen:

<img src="https://i.imgur.com/dbRfA7N.jpeg"/>

We will give our rule a name and press Next:

<img src="https://i.imgur.com/0446R6Q.jpeg"/>

Next, we will modify the Event Pattern and choose GuardDuty as an AWS Service followed by GuardDuty Finding as the Event Type:

<img src="https://i.imgur.com/upSsHIc.jpeg"/>

You can also change the event pattern to only include findings of a certain severity and higher, but for now we will leave it as default.

On the next page, we will choose SNS Topic as our target and we will use the topic we created earlier as our Topic.

<img src="https://i.imgur.com/hOAn13R.jpeg"/>

Next, we will open the additional settings drop down and change the Configure target input to Input Transformer and then click on Configure input transformer:

<img src="https://i.imgur.com/2kIHbi7.jpeg"/>

After that we will paste in the code located at [] into the Input path and the code located at [] into the Template, this will make our alert arrive in a structured format.

<img src="https://i.imgur.com/6aPNOtD.jpeg"/>

We will leave the tags as they are:

<img src="https://i.imgur.com/rHStGUk.jpeg"/>

And finally we will click Create Rule on the next page and we should see our rule active on the dashboard:

<img src="https://i.imgur.com/wkmWk0b.jpeg"/>

## Testing
Now, to test our system we will go back to GuardDuty and click on settings in the sidebar:

<img src="https://i.imgur.com/gJuiGYI.jpeg"/>

We will scroll down to Sample Findings and press on the Generate Sample Findings button:

<img src="https://i.imgur.com/Ee9rEao.jpeg"/>

After we do this, we should receive messages from AWS detailing all of these findings:

<img src="https://i.imgur.com/Rtcv2zl.jpeg"/>

Once you can see those received messages, that means everythings works correctly and you are done!
