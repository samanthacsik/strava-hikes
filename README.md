# NOTE (2022-12-01): this repo is no longer maintained! I've started building out a Strava shinydashboard and have incorporated (and enhanced) this leafet heatmap there. Explore the app (still very much under construction) [here](https://samanthacsik.shinyapps.io/strava_dashboard/) and my [`strava-dashboard` repo here](https://github.com/samanthacsik/strava-dashboard).

# Visualizing my hikes (& other activities) using Strava data

I've been recording my hikes using [Strava](https://www.strava.com/) since late 2020 and finally got around to scraping the data to create my own heatmap using the [`rStrava`](https://fawda123.github.io/rStrava/) package.

A number of cool folks have created awesome maps with their own Strava data and wrote up blogs/articles for others (like me!) to learn from. I found [David Cullen's blogpost](https://www.dancullen.me/articles/creating-a-heatmap-in-r-with-google-polylines) most helpful for this particular project, though there are others (see list below).

I'm still working out better ways to to present the individual activity data -- the icons are super clustered at my most frequented trailheads. Suggestions are welcome!

If you're looking to create your own Strava heatmap, the most challenging part (in my experience) was just getting my account set up correctly. You should start by checking out the [Strava API documentation](https://developers.strava.com/docs/getting-started/). If you need a concrete example, here are the exact steps I followed:

1.  Log into Strava (or create an account if you don't already have one)
2.  Click on your profile icon (top right corner) \> Settings \> My API Application (from the left-hand menu)
3.  Provide Strava some information about your app (NOTE: I don't *totally* know what I'm doing here, but the information below worked for me):
    1.  Give your application a name (this can be anything, but I called mine `SamsHeatmaps`)

    2.  Select a category (since I wanted to create a heatmap, I chose `Visualizer` from the dropdown menu)

    3.  Provide a website URL for your app (I included the link to this GitHub repo)

    4.  Give it an Application Description (my description is, `Learning to use the rStrava package and hopefully create my own heatmaps`)

    5.  Provide an Authorized Callback Domain (I wrote `localhost`)

Once you save your API Application information, you'll be provided with both a `Client Secret` and an `Access Token`, both of which you need in order to scrape your data. Using the `rStrava` package makes it pretty easy to do so. The first step is to create a "Strava Token", using the following code:

```{r, eval = FALSE}
app_name <- "<APP NAME>"
app_client_id <- "<CLIENT ID>"
app_secret <- "<CLIENT SECRET>"

my_token <- httr::config(token = strava_oauth(app_name, app_client_id, app_secret,
                                              app_scope = "activity:read_all"))
```

A browser window should open asking you to authorize Strava to access your data. Once you agree, it'll return a message in the browser, `Authentication complete. Please close this page and return to R.` This means things are working!

You're now ready to scrape, wrangle, and plot your data! Check out my [`strava_hikes.Rmd`](https://github.com/samanthacsik/strava-hikes/blob/main/code/strava_hikes.Rmd) file to see how I created my `leaflet` map.

**Other resources:**

-   [How to Scrape and Store Strava Data Using R](https://rviews.rstudio.com/2021/11/22/strava-data/), by Julian During
-   [Animate your Strava activities in R using rStrava and gganimate](https://padpadpadpad.github.io/post/animate-your-strava-activities-using-rstrava-and-gganimate/) by Daniel Padfield
-   [Getting Started with the Strava API](https://developers.strava.com/docs/getting-started/)
