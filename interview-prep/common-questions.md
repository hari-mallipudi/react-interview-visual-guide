# Top 50 React Interview Questions & Answers

## 🎯 How to Use This Document

- **Junior Level:** Focus on questions 1-20
- **Mid Level:** Focus on questions 1-40
- **Senior Level:** All questions + be ready to explain tradeoffs

---

## 🔥 Section 1: Fundamentals (Must Know)

### 1. What is React?
**Answer:** "React is a JavaScript library for building user interfaces, maintained by Meta. It uses a component-based architecture where UIs are broken into reusable pieces. React uses a Virtual DOM to efficiently update the actual DOM."

**Follow-up:** What makes React different from other frameworks?
- Component-based architecture
- Virtual DOM for performance
- Unidirectional data flow
- Large ecosystem

---

### 2. What is the Virtual DOM? How does it work?
**Answer:** "The Virtual DOM is an in-memory representation of the real DOM. When state changes, React creates a new Virtual DOM tree, compares it with the previous one (diffing/reconciliation), calculates the minimal changes needed, and updates only those parts of the real DOM. This makes updates efficient."

**Technical depth:** "React uses a reconciliation algorithm. It compares trees level by level, uses component types and keys to identify changes, and batches updates for performance."

---

### 3. What is JSX?
**Answer:** "JSX is a syntax extension for JavaScript that looks like HTML. It gets compiled to React.createElement() calls by Babel. JSX makes React code more readable and allows us to write markup directly in JavaScript."

**Example:**
```javascript
// JSX
const element = <h1>Hello</h1>;

// Compiles to
const element = React.createElement('h1', null, 'Hello');
```

---

### 4. What are components in React?
**Answer:** "Components are independent, reusable pieces of UI. They accept inputs called props and return React elements describing what should appear on screen. There are functional components (modern, use hooks) and class components (legacy)."

**Modern answer:** "I use functional components with hooks, which are simpler and more performant than class components."

---

### 5. What is the difference between Props and State?
**Answer:** 
- **Props:** Passed from parent, read-only, used for communication
- **State:** Internal to component, mutable, triggers re-renders when changed

"Props flow down (parent to child), state is local to component. Props are like function parameters, state is like variables declared inside the function."

---

## 🎣 Section 2: Hooks (Core Knowledge)

### 6. What are React Hooks?
**Answer:** "Hooks are functions that let you use state and other React features in functional components. They were introduced in React 16.8. Common hooks include useState, useEffect, useContext. They follow two rules: only call at top level, only call from React functions."

**Why hooks?** "They solve: code reuse (custom hooks), complex components (split logic), wrapper hell, and make functional components as powerful as classes."

---

### 7. Explain useState Hook
**Answer:** "useState adds state to functional components. It returns an array with current state value and setter function. The setter triggers re-render."

**Example:**
```javascript
const [count, setCount] = useState(0);
// count is current value
// setCount updates it
// 0 is initial value
```

**Important:** "State updates are asynchronous. To update based on previous state, use functional form: `setCount(prev => prev + 1)`"

---

### 8. Explain useEffect Hook
**Answer:** "useEffect runs side effects after render. It replaces componentDidMount, componentDidUpdate, and componentWillUnmount from class components."

**Three behaviors:**
```javascript
useEffect(() => {}); // Runs after every render
useEffect(() => {}, []); // Runs once (mount)
useEffect(() => {}, [dep]); // Runs when dep changes
```

**Cleanup:** "Return function runs before unmount or before next effect. Essential for preventing memory leaks from subscriptions, timers, etc."

---

### 9. What are dependencies in useEffect?
**Answer:** "The dependency array tells React when to re-run the effect. Include all values from component scope that the effect uses. Empty array means run once. No array means run every render."

**Common mistake:** "Forgetting dependencies can cause stale closures. ESLint plugin helps catch this."

---

### 10. When would you use useReducer instead of useState?
**Answer:** "Use useReducer when:
- State logic is complex (multiple sub-values)
- Next state depends on previous state
- Want to optimize performance (pass dispatch instead of callbacks)
- Similar to Redux pattern"

**Example scenario:** "Form with many fields, undo/redo functionality, complex state transitions."

---

### 11. Explain useContext Hook
**Answer:** "useContext accesses Context value without wrapping component in Consumer. It subscribes to Context changes and re-renders when value updates."

**Pattern:**
```javascript
const ThemeContext = createContext();

// Provider
<ThemeContext.Provider value={theme}>

// Consumer
const theme = useContext(ThemeContext);
```

---

### 12. What is useMemo and when to use it?
**Answer:** "useMemo caches the result of expensive calculations. It only recalculates when dependencies change."

**Use when:**
- Expensive computation
- Referential equality matters (passing object to memoized component)
- NOT for every calculation (has overhead)

```javascript
const expensiveValue = useMemo(() => {
  return computeExpensive(a, b);
}, [a, b]);
```

---

### 13. What is useCallback and when to use it?
**Answer:** "useCallback caches function reference. Use when passing callbacks to memoized child components to prevent unnecessary re-renders."

**Example:**
```javascript
const handleClick = useCallback(() => {
  doSomething(a, b);
}, [a, b]);

<MemoizedChild onClick={handleClick} />
```

**Without useCallback:** handleClick is new function every render, child re-renders even with React.memo.

---

### 14. useRef vs useState - when to use which?
**Answer:** 
- **useState:** When change should trigger re-render
- **useRef:** When change should NOT trigger re-render

**useRef use cases:**
- DOM references: `inputRef.current.focus()`
- Storing mutable values: previous value, timers, subscriptions
- Persists across re-renders without causing them

---

### 15. What are Custom Hooks?
**Answer:** "Custom hooks are reusable functions that can use other hooks. Name must start with 'use'. They extract component logic into reusable functions."

**Example:**
```javascript
function useLocalStorage(key, initialValue) {
  const [value, setValue] = useState(() => {
    return localStorage.getItem(key) || initialValue;
  });
  
  useEffect(() => {
    localStorage.setItem(key, value);
  }, [key, value]);
  
  return [value, setValue];
}
```

**Why:** "Solves code reuse without HOCs or Render Props. Cleaner and more composable."

---

## 🏗️ Section 3: Component Patterns

### 16. What is prop drilling and how to avoid it?
**Answer:** "Prop drilling is passing props through multiple component levels to reach deeply nested child."

**Solutions:**
1. Context API - for global data (theme, auth)
2. Component composition - pass components as props
3. State management - Redux, Zustand for complex state

---

### 17. What is React.memo?
**Answer:** "React.memo is a higher-order component that memoizes component. It prevents re-render if props haven't changed (shallow comparison)."

**When to use:**
- Expensive render
- Pure component (same props = same output)
- NOT everywhere (has overhead)

```javascript
const MemoizedComponent = React.memo(Component);
```

---

### 18. What are Higher-Order Components (HOC)?
**Answer:** "HOC is a function that takes a component and returns a new component with added functionality. It's a pattern for reusing component logic."

**Example:** `withAuth(Component)` adds authentication logic.

**Modern alternative:** "Custom hooks are now preferred. HOCs can cause wrapper hell and ref issues."

---

### 19. What is the Render Props pattern?
**Answer:** "A component with a render prop takes a function as prop and calls it to determine what to render."

```javascript
<DataProvider render={(data) => (
  <Component data={data} />
)} />
```

**Modern alternative:** "Custom hooks replaced most render props use cases."

---

### 20. Explain Controlled vs Uncontrolled Components
**Answer:** 
- **Controlled:** React state is source of truth. Input value controlled by state.
```javascript
<input value={state} onChange={e => setState(e.target.value)} />
```

- **Uncontrolled:** DOM is source of truth. Use refs to get value.
```javascript
<input ref={inputRef} />
// Access via inputRef.current.value
```

**Prefer controlled** for validation, conditional display, enforcing input format.

---

## ⚡ Section 4: Performance

### 21. How do you optimize React performance?
**Answer:** "Key strategies:
1. React.memo for expensive components
2. useMemo/useCallback for values and functions
3. Code splitting with React.lazy
4. Virtualization for long lists
5. Avoid inline functions in render
6. Proper key usage in lists
7. Profiler to measure before optimizing"

---

### 22. What is Code Splitting in React?
**Answer:** "Code splitting breaks bundle into chunks loaded on demand. Reduces initial load time."

**Implementation:**
```javascript
const Component = React.lazy(() => import('./Component'));

<Suspense fallback={<Loading />}>
  <Component />
</Suspense>
```

**Strategy:** Route-based splitting is most common.

---

### 23. Why are keys important in React lists?
**Answer:** "Keys help React identify which items changed, were added, or removed during reconciliation. Without keys or with indices, React may re-render entire list unnecessarily."

**Best practice:** Use stable unique IDs, NOT array indices (causes bugs with reordering).

```javascript
items.map(item => <div key={item.id}>{item.name}</div>)
```

---

### 24. What is React.lazy and Suspense?
**Answer:** "React.lazy enables code splitting at component level. Suspense provides fallback while component loads."

```javascript
const Heavy = React.lazy(() => import('./Heavy'));

<Suspense fallback={<Spinner />}>
  <Heavy />
</Suspense>
```

**React 18+:** Suspense also works for data fetching (experimental).

---

### 25. How to handle large lists in React?
**Answer:** "For 100+ items, use virtualization (react-window or react-virtualized). Only renders visible items, dramatically improves performance."

**Alternative:** Pagination or infinite scroll for server-side data.

---

## 🏪 Section 5: State Management

### 26. When would you use Context API vs Redux?
**Answer:** 
- **Context:** Simple global state (theme, auth, language). Built-in, no dependencies.
- **Redux:** Complex apps with many actions, middleware needs (side effects), time-travel debugging.

"Context can cause performance issues at scale (all consumers re-render). Redux with selectors is more optimized."

---

### 27. What is Redux and how does it work?
**Answer:** "Redux is a state management library. Single store holds all state. State is read-only, changed via dispatching actions. Reducers specify how state changes."

**Flow:** Component → dispatch(action) → reducer → new state → component re-renders

**Modern:** Use Redux Toolkit, not plain Redux. Simplifies setup, includes best practices.

---

### 28. What is the difference between server state and client state?
**Answer:** 
- **Client state:** UI state, form inputs, modals. Tools: useState, Redux, Zustand
- **Server state:** API data, cached, can be stale. Tools: React Query, SWR

"React Query handles caching, background refetching, stale data management automatically."

---

### 29. What is React Query and when to use it?
**Answer:** "React Query (TanStack Query) manages server state. Handles caching, refetching, pagination, optimistic updates."

**Use when:** Fetching/mutating server data. Replaces useState + useEffect for data fetching.

**Benefits:** Less boilerplate, automatic caching, better UX.

---

### 30. Explain useReducer in detail
**Answer:** "useReducer is an alternative to useState for complex state logic."

```javascript
const [state, dispatch] = useReducer(reducer, initialState);

function reducer(state, action) {
  switch(action.type) {
    case 'increment': return {count: state.count + 1};
    default: return state;
  }
}
```

**When:** Multiple sub-values, complex updates, want to pass dispatch to optimize.

---

## 🧪 Section 6: Testing & Best Practices

### 31. How do you test React components?
**Answer:** "Use React Testing Library. Test user behavior, not implementation details."

**Example:**
```javascript
render(<Component />);
const button = screen.getByRole('button');
fireEvent.click(button);
expect(screen.getByText('Clicked')).toBeInTheDocument();
```

**Avoid:** Testing state directly, implementation details, snapshot abuse.

---

### 32. What is the difference between unit tests and integration tests?
**Answer:** 
- **Unit:** Test component in isolation, mock dependencies
- **Integration:** Test components working together
- **E2E:** Test entire user flows (Cypress, Playwright)

"Focus more on integration tests - test behavior users see."

---

### 33. What are Error Boundaries?
**Answer:** "Error Boundaries catch JavaScript errors in child component tree, log errors, display fallback UI."

```javascript
class ErrorBoundary extends Component {
  static getDerivedStateFromError(error) {
    return { hasError: true };
  }
  
  componentDidCatch(error, errorInfo) {
    logError(error, errorInfo);
  }
  
  render() {
    if (this.state.hasError) return <h1>Error!</h1>;
    return this.props.children;
  }
}
```

**Limitation:** Don't catch errors in event handlers, async code.

---

## 🚀 Section 7: Advanced Topics

### 34. What is React 18 Concurrent Rendering?
**Answer:** "Concurrent React can interrupt, pause, resume, or abandon renders. Enables features like useTransition and Suspense for better UX."

**Use case:** Keep UI responsive during expensive state updates.

---

### 35. Explain useTransition
**Answer:** "useTransition marks state updates as non-urgent. React can interrupt these to keep UI responsive."

```javascript
const [isPending, startTransition] = useTransition();

startTransition(() => {
  setSearchResults(hugeData); // Non-urgent
});
```

**Use when:** Expensive updates like filtering large lists, chart updates.

---

### 36. What are Server Components?
**Answer:** "React Server Components render on server, reducing bundle size. Can access backend directly (databases, file system). Only ships necessary JavaScript to client."

**Benefits:** Better performance, smaller bundles, easier data fetching.

**Limitation:** No interactivity (use 'use client' for interactive parts).

---

### 37. What is Hydration?
**Answer:** "Hydration is when React attaches event listeners to server-rendered HTML, making it interactive."

**Process:** Server sends HTML → Browser displays → React loads → Hydrates (adds interactivity)

**Issue:** Hydration mismatch when server/client render differently.

---

### 38. What is StrictMode?
**Answer:** "StrictMode is a development tool that highlights potential problems. Double-invokes effects to surface side effects."

```javascript
<StrictMode>
  <App />
</StrictMode>
```

**Benefits:** Warns about deprecated APIs, unsafe lifecycles, prepares for Concurrent Mode.

---

### 39. What are Portals?
**Answer:** "Portals render children into a DOM node outside parent hierarchy."

```javascript
ReactDOM.createPortal(child, domNode)
```

**Use cases:** Modals, tooltips, dropdowns (avoid z-index issues).

---

### 40. Explain React Fiber
**Answer:** "Fiber is React's reconciliation engine rewrite. Enables concurrent rendering by breaking work into units, prioritizing updates, pausing/resuming work."

**Result:** Better perceived performance, responsive UX during updates.

---

## 💼 Section 8: Real-World Scenarios

### 41-50. Scenario-Based Questions

**41. How would you handle authentication in React?**
- Context for auth state
- Protected routes
- Token in localStorage/cookies
- Refresh token flow
- Logout cleanup

**42. How to prevent unnecessary re-renders?**
- React.memo
- useCallback for functions
- useMemo for computed values
- Split state logically
- Use proper key props

**43. How to handle forms in React?**
- Controlled components (small forms)
- React Hook Form (large forms)
- Validation with Yup/Zod
- Error handling
- Submission state

**44. How to handle routing?**
- React Router v6
- Nested routes
- Protected routes
- Lazy loading routes
- Query parameters

**45. How would you structure a large React app?**
- Feature-based folders
- Shared components
- Custom hooks folder
- Utils/helpers
- State management structure

**46. How to handle API calls?**
- React Query for data fetching
- Axios/fetch
- Error handling
- Loading states
- Retry logic

**47. How to optimize bundle size?**
- Code splitting
- Tree shaking
- Lazy loading
- Analyze with webpack-bundle-analyzer
- Remove unused dependencies

**48. How to handle real-time updates?**
- WebSockets
- Server-Sent Events
- React Query with polling
- Optimistic updates

**49. How to implement infinite scroll?**
- Intersection Observer API
- React Query useInfiniteQuery
- Virtualization for performance
- Loading states

**50. How would you migrate from class to functional components?**
- Replace lifecycle methods with useEffect
- Convert this.state to useState
- Convert this to regular variables
- Custom hooks for reusable logic
- Test thoroughly

---

## 🎯 Interview Tips

### How to Structure Your Answers
1. **Simple explanation** (20 seconds)
2. **When to use it** (practical context)
3. **Show depth** (tradeoffs, alternatives)
4. **Personal experience** (if applicable)

### Red Flags to Avoid
- "I don't know" without attempting
- Claiming expertise in everything
- Disparaging other solutions
- Not admitting uncertainties

### Show Expertise
- Reference React version changes
- Mention performance considerations
- Discuss tradeoffs
- Know when NOT to use something

---

**Good luck with your interviews! 🚀**
