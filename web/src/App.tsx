import './styles/index.css';

function App() {
  return (
    <main>
			<h1>Wild League</h1>
			<p>Gaming experience across the Fediverse.</p>

			<div>
				<p>Gaming isn't just about playing</p>
				<p>Gaming is about <span>community</span> </p>
			</div>

			<form>
				<label htmlFor='email'>Join the waitlist:</label>
				<input id='email' type="email" placeholder='email' />
				<button type='submit'> Notify me when you launch </button>
			</form>
		</main>
  )
}

export default App
