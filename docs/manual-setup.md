# Manual Setup

First, we will create a very abstracted flowchart for our project to simplify and create an order for the development process. We will do this using [Miro](https://miro.com/).

Our flow chart looks like this:
![Flow Chart](https://i.imgur.com/kfx2hyp.jpeg)

Next we will use [Atlassian Jira](https://www.atlassian.com/software/jira) to create a more detailed plan according to our flow chart.

Now we will create our project step by step according to the flowchart and Jira board.

## Prerequisites

- AWS account with necessary permissions
- Access to the AWS Management Console
- Valid email address for receiving notifications

## Setting up GuardDuty

First, we want to set up GuardDuty. To do this, we will launch the AWS console and in the search bar, type in "GuardDuty":

![Search GuardDuty](https://i.imgur.com/jN2YbRq.jpeg)

Next, click on "GuardDuty" and proceed to enable the service for our AWS account. After this, we should see the GuardDuty dashboard:

![GuardDuty Dashboard](https://i.imgur.com/sLphTLH.jpeg)

## Setting up SNS

Now that we have GuardDuty, let's set up SNS (Simple Notification System). We will search for SNS in the search bar. After which, we will be greeted by this screen:

![Search SNS](https://i.imgur.com/0b90zKZ.jpeg)

We will type "GuardDuty-Alerts" in the Topic Name box and press "Next":

![Create Topic](https://i.imgur.com/XoNfUEG.jpeg)

We will leave everything as default and press "Create Topic".

![Create Topic Overview](https://i.imgur.com/1lHS3Cv.jpeg)

Now we can see an overview of our topic. Click on the "Create Subscription" button at the bottom.

![Create Subscription](https://i.imgur.com/NYPGeta.jpeg)

We are now shown a page with different options for our subscription:

![Subscription Options](https://i.imgur.com/Cfc5Adt.jpeg)

We will choose our newly created topic as the topic ARN. For the protocol, we will choose the Email protocol and enter our email address. You are free to choose whichever protocol suits you best:

![Email Subscription](https://i.imgur.com/IXdsB7w.jpeg)

We now have to confirm our subscription email by clicking on the link sent to us by AWS.

## Setting up CloudWatch

Next, we want to go back to the search bar, type in CloudWatch, and open it:

![Search CloudWatch](https://i.imgur.com/yUfO6PV.jpeg)

Expand the "Events" menu on the sidebar and click on "Rules".

![Expand Events Menu](https://i.imgur.com/aum33EV.jpeg)

Click the "Create Rule" button at the bottom of the screen:

![Create Rule](https://i.imgur.com/dbRfA7N.jpeg)

We will give our rule a name and press "Next":

![Name Rule](https://i.imgur.com/0446R6Q.jpeg)

Next, we will modify the Event Pattern. Choose "GuardDuty" as an AWS Service followed by "GuardDuty Finding" as the Event Type:

![Modify Event Pattern](https://i.imgur.com/upSsHIc.jpeg)

You can also change the event pattern to only include findings of a certain severity and higher, but for now, we will leave it as default.

On the next page, we will choose "SNS Topic" as our target and use the topic we created earlier as our Topic.

![Choose SNS Topic](https://i.imgur.com/hOAn13R.jpeg)

Open the additional settings drop-down and change the "Configure target input" to "Input Transformer" and then click on "Configure input transformer":

![Configure Input Transformer](https://i.imgur.com/2kIHbi7.jpeg)

After that we will paste in the code located at [/config/input_path.json](/config/input_path.json) into the Input path and the code located at [/config/input_template.json](/config/input_template.json) into the Template, this will make our alert arrive in a structured format.

![Input Transformer](https://i.imgur.com/6aPNOtD.jpeg)

Leave the tags as they are:

![Leave Tags](https://i.imgur.com/rHStGUk.jpeg)

Finally, click "Create Rule" on the next page and we should see our rule active on the dashboard:

![Rule Active](https://i.imgur.com/wkmWk0b.jpeg)

## Testing

To test our system, go back to GuardDuty and click on "Settings" in the sidebar:

![GuardDuty Settings](https://i.imgur.com/gJuiGYI.jpeg)

Scroll down to "Sample Findings" and press the "Generate Sample Findings" button:

![Generate Sample Findings](https://i.imgur.com/Ee9rEao.jpeg)

After we do this, we should receive messages from AWS detailing all of these findings:

![Received Messages](https://i.imgur.com/Rtcv2zl.jpeg)

Once you can see those received messages, that means everything works correctly and you are done!
